<?php
if (isset($_POST['ok'], $_POST['name'])) {

    $_POST['name'] = trimALL($_POST['name']);
    $_POST['itemprop_pic']   = trimALL($_POST['itemprop_pic']);
    $_POST['itemprop_url']   = trimALL($_POST['itemprop_url']);

    $error = array();

    if (empty($_POST['name'])) {
        $error['name'] = 'Вы не ввели - названия';
    }

    $count = q("SELECT `id` FROM `data` WHERE `module_id` = '".(int)$_GET['module_id']."' AND `template_id`  = '".(int)$_GET['template_id']."'");
    if($count->num_rows >= 6) {
        $error['count'] = 'Невозможно добавить картину. Картины в каруселе не должно привышать 6 шт';
    }

    if (!count($error)) {
        if (isset($_POST['img'])) {
            if (!array_key_exists('mini', $_POST['img'])) {
                $error['mini'] = 'Вы не загрузили мини картину';
            } elseif (!array_key_exists('preview', $_POST['img'])) {
                $error['preview'] = 'Вы не загрузили полную картину';
            } else {
                $test_isset = 'ok';
            }
        } else {
            $error['mini'] = 'Вы не загрузили картины';
        }

        if(isset($test_isset) && $test_isset == 'ok') {
            foreach ($_POST['img'] as $img_key_upl => $img_val_upl) {
                if($img_key_upl == 'mini') {
                    $upload = new \MyLibs\Uploader();
                    $upload->minwidth = 64;
                    $upload->minheight = 64;
                    $upload->save_origin = false;
                    $name = date('Ymd-his') . 'carusel-'.$img_key_upl . rand(100000, 999999) . '.jpg';
                    try {
                        $file = $upload->cropUpload($img_key_upl, $img_val_upl, $name);
                        $upload->hasResize();
                        $test_mini = 'ok';
                    } catch (Exception $e) {
                        $error['mini'] = 'Мини картина - ' . $e;
                        $test_mini = 'error';
                    }
                } elseif($img_key_upl == 'preview') {
                    $upload_preview = new \MyLibs\Uploader();
                    $upload_preview->minwidth = 704;
                    $upload_preview->minheight = 433;
                    $upload_preview->save_origin = false;
                    $name_preview = date('Ymd-his') . 'carusel-'.$img_key_upl . rand(100000, 999999) . '.jpg';
                    try {
                        $file = $upload_preview->cropUpload($img_key_upl, $img_val_upl, $name_preview);
                        $upload_preview->hasResize();
                        $test_preview = 'ok';
                    } catch (Exception $e) {
                        $error['preview'] = 'Полная картина - ' . $e;
                        $test_preview = 'error';
                    }
                }
            }
        }

        if(isset($test_mini, $test_preview)) {
            if($test_mini == 'ok') {
                if($test_preview == 'ok') {
                    foreach ($_POST['img'] as $img_key => $img_val) {
                        if($img_key == 'mini') {
                            $upload->load();
                            $upload->resize(64, 64, 'mini');
                        } elseif($img_key == 'preview') {
                            $upload_preview->load();
                            $upload_preview->resize(704, 433, 'mini');
                        }
                    }
                }
            }
        }
    }

    if (!count($error)) {
        q("INSERT INTO `data` SET
			`module_id`    = '".(int)$_GET['module_id']."',
			`template_id`  = '".(int)$_GET['template_id']."',
			`name`         = '".es($_POST['name'])."',
			`des`          = '',
			`text`         = '".es($_POST['text'])."',
			`date`         = NOW(),
			`mini`         = '".es($upload->refilename)."',
			`img`          = '".es($upload_preview->refilename)."',
			`itemprop_pic`     = '".es($_POST['itemprop_pic'])."',
			`itemprop_url`     = '".es($_POST['itemprop_url'])."'
		");

        $_SESSION['info'] = 'Картина успешно добавлена';
        header("location: /admin/data");
        exit();
    }

}