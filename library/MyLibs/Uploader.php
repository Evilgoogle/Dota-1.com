<?php
namespace MyLibs;

class Uploader  extends \FW\Form\Uploader {

    private $basefilename = '';
    private $img;
    private $prop;
    private $uploaded = false;
    private $source;
    private $file;
    public  $defalutfilename;
    public  $refilename;

    private function setError($error) {
        throw new \Exception(hc($this->basefilename).'. '.$error);
    }

    public function generateFileName($file,$name = '') {
        if(empty($name)) {
            $tmp = date('U').strtolower(substr($file, -8, 4)).'.jpg';
        } else {
            $tmp = $name;
        }
        $this->tmpfilename = \Core::$ROOT.'/uploads/full/'.$tmp;
        $this->filename = $this->subdir.$tmp;
        $this->defalutfilename = '/uploads/full/'.$tmp;
        return true;
    }

    public function cropUpload($key, $codeImg, $name) {
        $this->uploaded = true;

        $ifp = fopen('./uploads/tmp/dummy'.$key.'.jpg', "wb");
        $data = explode(',', $codeImg);
        fwrite($ifp, base64_decode($data[1]));
        fclose($ifp);

        $this->file = './uploads/tmp/dummy'.$key.'.jpg';

        if(!file_exists($this->file)) {
            $this->setError('Не найдено обрезанное изображение');
        } else {
            $filesize = filesize($this->file);
            if($filesize < 1000) {
                $this->setError('Размер файла слишком мал');
            } elseif($filesize > 10000000) {
                $this->setError('Размер файла слишком большой');
            }

            $this->img = getimagesize($this->file);
            if($this->img[0] < $this->minwidth) {
                $this->setError('Ширина файла слишком мала. Минимальные требования '.$this->minwidth.' px');
            } elseif($this->img[1] < $this->minheight) {
                $this->setError('Высота файла слишком мала. Минимальные требования '.$this->minheight.' px');
            }
            $this->prop = $this->img[0]/$this->img[1];
            if(($this->prop >= 1 && $this->prop > 5) || ($this->prop <= 1 && $this->prop < 0.2)) {
                $this->setError('Неверная пропорция файла');
            }

            $this->generateFileName($this->file, $name);
            return true;
        }
    }

    public function fullUpload($key, $img, $name) {
        $ifp = fopen('./uploads/tmp/dummy_full'.$key.'.jpg', "wb");
        $data = explode(',', $img);
        fwrite($ifp, base64_decode($data[1]));
        fclose($ifp);

        $this->file = './uploads/tmp/dummy_full'.$key.'.jpg';
        $this->generateFileName($this->file, $name);

        copy($this->file,$this->tmpfilename);
        unlink($this->file);
    }

    public function load() {
        if(!$this->notuploaded) {
            if(!copy($this->file,$this->tmpfilename)) {
                $this->setError('Ошибка при загрузке файла');
            }
        }
        unlink($this->file);

        ini_set('gd.jpeg_ignore_warning', 1);
        if($this->img['mime'] == 'image/png') {
            $this->source = imagecreatefrompng($this->tmpfilename);
        } else {
            $this->source = imagecreatefromjpeg($this->tmpfilename);
            if(function_exists('exif_read_data')) {
                $exif = exif_read_data($this->tmpfilename);
                if(!empty($exif['Orientation'])) {
                    switch($exif['Orientation']) {
                        case 8:
                            $this->source = imagerotate($this->source,90,0);
                            $tmp = $this->img[0];
                            $this->img[0] = $this->img[1];
                            $this->img[1] = $tmp;
                            $this->prop = $this->img[0]/$this->img[1];
                            break;
                        case 3:
                            $this->source = imagerotate($this->source,180,0);
                            break;
                        case 6:
                            $this->source = imagerotate($this->source,-90,0);
                            $tmp = $this->img[0];
                            $this->img[0] = $this->img[1];
                            $this->img[1] = $tmp;
                            $this->prop = $this->img[0]/$this->img[1];
                            break;
                    }
                }
            }
        }
    }

    public function hasResize() {
        if(empty($this->filename) || empty($this->prop) || !is_array($this->img)) {
            $this->setError('Не включены файлы для изменения размера');
        }
        return true;
    }

    public function resize($width,$height,$to,$watermark = false) {
        $beginwidth = $width;

        $tmp = $width/$this->prop;
        if($tmp > $height) {
            $width = round($height*$this->prop);
        } else {
            $height = round($tmp);
        }

        $thumb = imagecreatetruecolor($width, $height);
        imagecopyresampled($thumb, $this->source, 0, 0, 0, 0, $width, $height, $this->img[0], $this->img[1]);

        if($watermark) {
            $stamp = imagecreatefrompng(\Core::$ROOT.$this->watermark);
            $watermarksize = getimagesize(\Core::$ROOT.$this->watermark);
            $watermarkprop = 600/$beginwidth;
            if($watermarkprop != 1) {
                $targetImage = imagecreatetruecolor( $watermarksize[0]/$watermarkprop, $watermarksize[1]/$watermarkprop );
                imagealphablending( $targetImage, false );
                imagesavealpha( $targetImage, true );

                imagecopyresampled( $targetImage, $stamp,
                    0, 0,
                    0, 0,
                    $watermarksize[0]/$watermarkprop, $watermarksize[1]/$watermarkprop,
                    $watermarksize[0], $watermarksize[1]);
                $stamp = $targetImage;
            }
            $marge_right = 5;
            $marge_bottom = 5;
            $sx = imagesx($stamp);
            $sy = imagesy($stamp);
            imagecopy($thumb, $stamp, $width - $sx - $marge_right, $height - $sy - $marge_bottom, 0, 0, $sx, $sy);
        }

        imagejpeg($thumb,\Core::$ROOT.'/uploads/'.$to.'/'.$this->filename,100);
        imagedestroy($thumb);
        $this->refilename = '/uploads/'.$to.'/'.$this->filename;
        return true;
    }

    public function __destruct() {
        if(!$this->save_origin && $this->uploaded && file_exists($this->tmpfilename)) {
            unlink($this->tmpfilename);
        }
        @unlink($this->file);
    }
}