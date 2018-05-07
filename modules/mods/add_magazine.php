<?php
if (isset($_POST['ok'], $_POST['name'], $_POST['price'])) {

    $_POST['name'] = trimALL($_POST['name']);
    $_POST['des'] = trimALL($_POST['des']);
    $_POST['text'] = trimALL($_POST['text']);
    $_POST['price'] = trimALL($_POST['price']);
    $_POST['itemprop_pic']   = trimALL($_POST['itemprop_pic']);
    $_POST['itemprop_name']  = trimALL($_POST['itemprop_name']);
    $_POST['itemprop_des']   = trimALL($_POST['itemprop_des']);
    $_POST['itemprop_text']  = trimALL($_POST['itemprop_text']);
    $_POST['itemprop_price'] = trimALL($_POST['itemprop_price']);
    $_POST['itemprop_url']   = trimALL($_POST['itemprop_url']);

    $error = array();

    if (empty($_POST['name'])) {
        $error['name'] = 'Вы не ввели - названия';
    }

    if (empty($_POST['price'])) {
        $error['price'] = 'Вы не ввели - цена';
    } elseif(!is_numeric($_POST['price'])) {
        $error['price'] = 'Цена может состоять только из цифр';
    }

    if (!count($error)) {
        if (isset($_POST['img'])) {
            if (!array_key_exists('mini', $_POST['img'])) {
                $error['mini'] = 'Вы не загрузили мини картину';
            } elseif (!array_key_exists('pic', $_POST['img'])) {
                $error['pic'] = 'Вы не загрузили картины товара. Должна быть хотя бы одна';
            } else {
                foreach ($_POST['img'] as $test_pic_key=>$test_pic) {
                    if ($test_pic_key == 'pic') {
                        foreach ($test_pic as $test_number => $test_arr) {
                            if (!array_key_exists('mini', $test_arr)) {
                                $error['pics']['pics_mini'][$test_number] = 'Мини картина товара - Вы не загрузили картину. Проверяйте, поставили ли вы картины на все созданные поля';
                                $test_isset = 'error';
                            } elseif (!array_key_exists('preview', $test_arr)) {
                                $error['pics']['pics_preview'][$test_number] = 'Превью картина товара - Вы не загрузили картину. Проверяйте, поставили ли вы картины на все созданные поля';
                                $test_isset = 'error';
                            } else {
                                $test_isset = 'ok';
                            }
                        }
                    }
                }
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
                    $name = date('Ymd-his') . 'magazine' . rand(100000, 999999) . '.jpg';
                    try {
                        $file = $upload->cropUpload($img_key_upl, $img_val_upl, $name);
                        $upload->hasResize();
                        $test_mini = 'ok';
                    } catch (Exception $e) {
                        $error['mini'] = 'Мини картина - ' . $e;
                        $test_mini = 'error';
                    }
                } elseif($img_key_upl == 'pic') {
                    foreach ($img_val_upl as $number_key_upl=>$number_upl) {
                        foreach ($number_upl as $key_upl => $pic_upl) {
                            if ($key_upl == 'mini') {
                                $upload_mini[$number_key_upl] = new \MyLibs\Uploader();
                                $upload_mini[$number_key_upl]->minwidth = 70;
                                $upload_mini[$number_key_upl]->minheight = 54;
                                $upload_mini[$number_key_upl]->save_origin = false;
                                $name_mini = date('Ymd-his') . 'magazine' . $key_upl. '' . rand(100000, 999999) . '.jpg';
                                try {
                                    $file_mini = $upload_mini[$number_key_upl]->cropUpload($key_upl.$number_key_upl, $pic_upl, $name_mini);
                                    $upload_mini[$number_key_upl]->hasResize();
                                    $test_pic_mini[$number_key_upl] = 'ok';
                                } catch (Exception $e) {
                                    $error['pics']['pics_mini'][$number_key_upl] = $number_key_upl.'. Мини картина товара- ' . $e;
                                    $test_pic_mini[$number_key_upl] = 'error';
                                }
                            } elseif ($key_upl == 'preview') {
                                $upload_preview[$number_key_upl] = new \MyLibs\Uploader();
                                $upload_preview[$number_key_upl]->minwidth = 209;
                                $upload_preview[$number_key_upl]->minheight = 224;
                                $upload_preview[$number_key_upl]->save_origin = false;
                                $name_preview = date('Ymd-his') . 'magazine' . $key_upl. '' . rand(100000, 999999) . '.jpg';
                                try {
                                    $file_preview = $upload_preview[$number_key_upl]->cropUpload($key_upl.$number_key_upl, $pic_upl, $name_preview);
                                    $upload_preview[$number_key_upl]->hasResize();
                                    $test_pic_preview[$number_key_upl] = 'ok';
                                } catch (Exception $e) {
                                    $error['pics']['pics_preview'][$number_key_upl] = $number_key_upl.'. Превью картина товара- ' . $e;
                                    $test_pic_preview[$number_key_upl] = 'error';
                                }
                            } elseif($key_upl == 'full') {
                                $full_upload[$number_key_upl] = new \MyLibs\Uploader();
                            }
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
			`des`          = '".es($_POST['des'])."',
			`text`         = '".es($_POST['text'])."',
			`date`         = NOW(),
			`mini`         = '".es('/uploads/mini/'.$upload->filename)."',
			`price`        = '".(int)$_POST['price']."',
			`itemprop_pic`     = '".es($_POST['itemprop_pic'])."',
			`itemprop_name`    = '".es($_POST['itemprop_name'])."',
			`itemprop_des`     = '".es($_POST['itemprop_des'])."',
			`itemprop_text`    = '".es($_POST['itemprop_text'])."',
			`itemprop_price`   = '".es($_POST['itemprop_price'])."',
			`itemprop_url`     = '".es($_POST['itemprop_url'])."'
		");

        $id = \DB::_()->insert_id;

        //Properties
        foreach ($_POST['properties'] as $cat_id => $prop_arr) {
            foreach ($prop_arr as $prop_text => $prop) {
                foreach ($prop as $pro_val) {
                    q("INSERT INTO `data_properties` SET
                            `data_id`  = " . (int)$id . ",
                            `prop_id`  = " . (int)$prop . ",
                            `cat_id`   = " . (int)$cat_id . ",
                            `properties`    = '" . es($prop_text) . "'
                    ");
                }
            }
        }

        //img
        $error_mini = 'ok';
        $error_preview = 'ok';
        if(isset($test_mini, $test_pic_mini, $test_pic_preview)) {
            foreach ($test_pic_mini as $executed_mini) {
                if($executed_mini == 'error') {
                    $error_mini = 'error';
                }
            }
            foreach ($test_pic_preview as $executed_preview) {
                if($executed_preview == 'error') {
                    $error_preview = 'error';
                }

            }
            if($test_mini == 'ok') {
                if($error_mini == 'ok') {
                    if($error_preview == 'ok') {
                        foreach ($_POST['img'] as $img_key => $img_val) {
                            if($img_key == 'mini') {
                                $upload->load();
                                $upload->resize(64, 64, 'mini');
                            } elseif($img_key == 'pic') {
                                foreach ($img_val as $number_key=>$number) {
                                    foreach ($number as $key => $pic) {
                                        if ($key == 'mini') {
                                            $upload_mini[$number_key]->load();
                                            $upload_mini[$number_key]->resize(70, 54, 'mini');
                                        } elseif ($key == 'preview') {
                                            $upload_preview[$number_key]->load();
                                            $upload_preview[$number_key]->resize(209, 224, 'mini');
                                        } elseif($key == 'full') {
                                            $full_upload[$number_key]->fullUpload($key,$pic,date('Ymd-his') . 'magazine' . $key. '' . rand(100000, 999999) . '.jpg');
                                        }
                                    }
                                    q("INSERT INTO `gallery` SET
                                        `data_id`    = '".(int)$id."',
                                        `mini`    = '".es($upload_mini[$number_key]->refilename)."',
                                        `preview`    = '".es($upload_preview[$number_key]->refilename)."',
                                        `img`    = '".es($full_upload[$number_key]->defalutfilename)."'
                                     ");
                                }
                            }
                        }
                    }
                }
            }
        }
        $_SESSION['info'] = 'Запись успешно добавлена';
        redirect("/".$_POST['module_name']."");
    }

}

if(isset($_SESSION['user'])) {
    if ($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {
        ////////////////
        if(isset($_GET['module_id'], $_GET['template_id'], $_GET['template'], $_GET['module_name'])) {
            $subcat = [];
            $get_subcat = q("SELECT * FROM `cat` WHERE `module_id` = ".(int)$_GET['module_id']." AND `template_id` = ".(int)$_GET['template_id']."");
            while ($set_subcat = $get_subcat->fetch_assoc()) {
                $subcat[] = $set_subcat;
            }
            $get_properties = q("SELECT * FROM `cat_properties`");
            while ($set_properties = $get_properties->fetch_assoc()) {
                $properties[] = $set_properties;
            }
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