<?php
if (isset($_POST['ok'], $_POST['name'])) {

    $_POST['name'] = trimALL($_POST['name']);
    $_POST['itemprop_pic']     = trimALL($_POST['itemprop_pic']);
    $_POST['itemprop_author']  = trimALL($_POST['itemprop_author']);
    $_POST['itemprop_date']    = trimALL($_POST['itemprop_date']);

    $error = array();

    if (empty($_POST['name'])) {
        $error['name'] = 'Вы не ввели - названия';
    }

    if (!count($error)) {
        if (isset($_POST['img'])) {
            if (!array_key_exists('mini', $_POST['img'])) {
                $error['mini'] = 'Вы не загрузили мини картину';
            } elseif (!array_key_exists('preview', $_POST['img'])) {
                $error['preview'] = 'Вы не загрузили превью картину';
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
                    $name = date('Ymd-his') . 'gal-'. $img_key_upl . rand(100000, 999999) . '.jpg';
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
                    $upload_preview->minwidth = 283;
                    $upload_preview->minheight = 203;
                    $upload_preview->save_origin = false;
                    $name_preview = date('Ymd-his') . 'gal-'. $img_key_upl . rand(100000, 999999) . '.jpg';
                    try {
                        $file = $upload_preview->cropUpload($img_key_upl, $img_val_upl, $name_preview);
                        $upload_preview->hasResize();
                        $test_preview = 'ok';
                    } catch (Exception $e) {
                        $error['preview'] = 'Превью картина - ' . $e;
                        $test_preview = 'error';
                    }
                } elseif($img_key_upl == 'full') {
                    $full_upload = new \MyLibs\Uploader();
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
                            $upload_preview->resize(283, 203, 'mini');
                        } elseif($img_key == 'full') {
                            $full_upload->fullUpload($img_key,$img_val,date('Ymd-his') . 'gal-' . $img_key. '' . rand(100000, 999999) . '.jpg');
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
			`cat`          = '".(int)$_POST['subcat']."',
			`name`         = '".es($_POST['name'])."',
			`des`          = '',
			`text`         = '',
			`date`         = NOW(),
			`mini`         = '".es($upload->refilename)."',
			`preview`      = '".es($upload_preview->refilename)."',
			`img`          = '".es($full_upload->defalutfilename)."',
			`itemprop_pic`      = '".es($_POST['itemprop_pic'])."',
			`itemprop_author`   = '".es($_POST['itemprop_author'])."',
			`itemprop_date`     = '".es($_POST['itemprop_date'])."'
		");

        $_SESSION['info'] = 'Запись успешно добавлена';
        redirect("/".$_POST['module_name']."");
    }

}

if(isset($_SESSION['user'])) {
    if ($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {
        ////////////////
        if(isset($_GET['module_id'], $_GET['template_id'], $_GET['template'], $_GET['module_name'])) {
            $subcat = q("SELECT * FROM `cat` WHERE `module_id` = ".(int)$_GET['module_id']." AND `template_id` = ".(int)$_GET['template_id']."");
        } else {
            $_SESSION['def'] = 'Не все параметры редактирование переданы';
            redirect("/");
        }
        ///////////////
    } else {
        redirect("/404");
    }
} else {
    redirect("/404");
}