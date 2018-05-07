<?php
if (isset($_POST['ok'], $_POST['name'])) {

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

    $mod_temp = explode(',',$_POST['module_template']);

    $test_isset = 'ok';
    if (!count($error)) {
        if (isset($_POST['img'])) {
            if(array_key_exists('pic', $_POST['img'])) {
                foreach ($_POST['img'] as $test_pic_key => $test_pic) {
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
        }

        $test_mini = 'ok';
        if(isset($test_isset) && $test_isset == 'ok') {
            if (isset($_POST['img'])) {
                foreach ($_POST['img'] as $img_key_upl => $img_val_upl) {
                    if (array_key_exists('mini', $_POST['img'])) {
                        if ($img_key_upl == 'mini') {
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
                        }
                    }
                    if (array_key_exists('pic', $_POST['img'])) {
                        if ($img_key_upl == 'pic') {
                            foreach ($img_val_upl as $number_key_upl => $number_upl) {
                                foreach ($number_upl as $key_upl => $pic_upl) {
                                    if ($key_upl == 'mini') {
                                        $upload_mini[$number_key_upl] = new \MyLibs\Uploader();
                                        $upload_mini[$number_key_upl]->minwidth = 64;
                                        $upload_mini[$number_key_upl]->minheight = 64;
                                        $upload_mini[$number_key_upl]->save_origin = false;
                                        $name_mini = date('Ymd-his') . 'magazine' . $key_upl . '' . rand(100000, 999999) . '.jpg';
                                        try {
                                            $file_mini = $upload_mini[$number_key_upl]->cropUpload($key_upl . $number_key_upl, $pic_upl, $name_mini);
                                            $upload_mini[$number_key_upl]->hasResize();
                                            $test_pic_mini[$number_key_upl] = 'ok';
                                        } catch (Exception $e) {
                                            $error['pics']['pics_mini'][$number_key_upl] = $number_key_upl . '. Мини картина товара- ' . $e;
                                            $test_pic_mini[$number_key_upl] = 'error';
                                        }
                                    } elseif ($key_upl == 'preview') {
                                        $upload_preview[$number_key_upl] = new \MyLibs\Uploader();
                                        $upload_preview[$number_key_upl]->minwidth = 209;
                                        $upload_preview[$number_key_upl]->minheight = 224;
                                        $upload_preview[$number_key_upl]->save_origin = false;
                                        $name_preview = date('Ymd-his') . 'magazine' . $key_upl . '' . rand(100000, 999999) . '.jpg';
                                        try {
                                            $file_preview = $upload_preview[$number_key_upl]->cropUpload($key_upl . $number_key_upl, $pic_upl, $name_preview);
                                            $upload_preview[$number_key_upl]->hasResize();
                                            $test_pic_preview[$number_key_upl] = 'ok';
                                        } catch (Exception $e) {
                                            $error['pics']['pics_preview'][$number_key_upl] = $number_key_upl . '. Превью картина товара- ' . $e;
                                            $test_pic_preview[$number_key_upl] = 'error';
                                        }
                                    } elseif ($key_upl == 'full') {
                                        $full_upload[$number_key_upl] = new \MyLibs\Uploader();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        $error_mini = 'ok';
        $error_preview = 'ok';
        $mini_pic_uploaded = 'error';
        if(isset($test_pic_mini, $test_pic_preview)) {
            foreach ($test_pic_mini as $executed_mini) {
                if ($executed_mini == 'error') {
                    $error_mini = 'error';
                }
            }
            foreach ($test_pic_preview as $executed_preview) {
                if ($executed_preview == 'error') {
                    $error_preview = 'error';
                }

            }
        }
        if($test_isset == 'ok') {
            if ($test_mini == 'ok') {
                if ($error_mini == 'ok') {
                    if ($error_preview == 'ok') {
                        if (isset($_POST['img'])) {
                            foreach ($_POST['img'] as $img_key => $img_val) {
                                if (array_key_exists('mini', $_POST['img'])) {
                                    $del_mini = q("SELECT `mini` FROM `data` WHERE `id` = " . (int)$_GET['id'] . "");
                                    $set_mini_del = $del_mini->fetch_assoc();
                                    @unlink('.' . $set_mini_del['mini']);
                                    if ($img_key == 'mini') {
                                        $upload->load();
                                        $upload->resize(64, 64, 'mini');
                                        $mini_pic_uploaded = 'ok';
                                    }
                                }
                                if (array_key_exists('pic', $_POST['img'])) {
                                    if ($img_key == 'pic') {
                                        foreach ($img_val as $number_key => $number) {
                                            foreach ($number as $key => $pic) {
                                                if ($key == 'mini') {
                                                    $upload_mini[$number_key]->load();
                                                    $upload_mini[$number_key]->resize(64, 64, 'mini');
                                                } elseif ($key == 'preview') {
                                                    $upload_preview[$number_key]->load();
                                                    $upload_preview[$number_key]->resize(209, 224, 'mini');
                                                } elseif ($key == 'full') {
                                                    $full_upload[$number_key]->fullUpload($key, $pic, date('Ymd-his') . 'magazine' . $key . '' . rand(100000, 999999) . '.jpg');
                                                }
                                            }
                                            q("INSERT INTO `gallery` SET
                                                `data_id`    = '" . (int)$_GET['id'] . "',
                                                `mini`    = '" . es($upload_mini[$number_key]->refilename) . "',
                                                `preview`    = '" . es($upload_preview[$number_key]->refilename) . "',
                                                `img`    = '" . es($full_upload[$number_key]->defalutfilename) . "'
                                             ");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    $uploded_mini = ($mini_pic_uploaded == 'ok') ? $upload->refilename : $_POST['preview_mini'];

    if (!count($error)) {
        q("UPDATE `data` SET
			`module_id`    = '".(int)$mod_temp[0]."',
			`template_id`  = '".(int)$mod_temp[1]."',
			`name`         = '".es($_POST['name'])."',
			`des`          = '".es($_POST['des'])."',
			`text`         = '".es($_POST['text'])."',
			`date`         = NOW(),
			`mini`         = '".es($uploded_mini)."',
			`price`        = '".(int)$_POST['price']."',
			`itemprop_pic`     = '".es($_POST['itemprop_pic'])."',
			`itemprop_name`    = '".es($_POST['itemprop_name'])."',
			`itemprop_des`     = '".es($_POST['itemprop_des'])."',
			`itemprop_text`    = '".es($_POST['itemprop_text'])."',
			`itemprop_price`   = '".es($_POST['itemprop_price'])."',
			`itemprop_url`     = '".es($_POST['itemprop_url'])."'
			WHERE `id`     = '".(int)$_GET['id']."'
		");

        //Properties
        if(isset($_POST['properties'])) {
            foreach ($_POST['properties'] as $prop_set => $cat) {
                if ($prop_set == 'insert') {
                    foreach ($cat as $cat_id => $prop_arr) {
                        foreach ($prop_arr as $prop_text => $prop) {
                            foreach ($prop as $pro_val) {
                                q("INSERT INTO `data_properties` SET
                                `data_id`  = " . (int)$_GET['id'] . ",
                                `prop_id`  = " . (int)$pro_val . ",
                                `cat_id`   = " . (int)$cat_id . ",
                                `properties`    = '" . es($prop_text) . "'
                            ");
                            }
                        }
                    }
                } elseif ($prop_set == 'edit') {
                    foreach ($cat as $cat_id => $prop_arr) {
                        foreach ($prop_arr as $prop_text => $prop) {
                            foreach ($prop as $pro_val) {
                                q("UPDATE `data_properties` SET
                                `data_id`  = " . (int)$_GET['id'] . ",
                                `prop_id`  = " . (int)$prop . ",
                                `cat_id`   = " . (int)$cat_id . ",
                                `properties`    = '" . es($prop_text) . "'
                                WHERE `prop_id` = " . (int)$prop . "
                            ");
                            }
                        }
                    }
                } elseif ($prop_set == 'del') {
                    foreach ($cat as $cat_id => $prop_arr) {
                        foreach ($prop_arr as $prop_text => $prop) {
                            foreach ($prop as $pro_val) {
                                q("DELETE FROM `data_properties` WHERE `prop_id` = " . (int)$pro_val . "");
                            }
                        }
                    }
                }
            }
        }

        $_SESSION['info'] = 'Запись успешно отредактировано';
        header("location: /admin/data");
        exit();
    }

}
$data = q("SELECT * FROM `data` WHERE `id` = ".(int)$_GET['id']." LIMIT 1");
if (!mysqli_num_rows($data)) {
    $_SESSION['info'] = 'Данная запись не существует';
    header ("location: /admin/data");
    exit();
} else {
    $set_data = $data->fetch_assoc();
    $data_json = json_encode($set_data);
}

$subcat = [];
$get_subcat = q("SELECT * FROM `cat` WHERE `template_id` = ".(int)$_GET['template_id']."");
while ($set_subcat = $get_subcat->fetch_assoc()) {
    $subcat[] = $set_subcat;
}
$get_properties = q("SELECT * FROM `cat_properties`");
while ($set_properties = $get_properties->fetch_assoc()) {
    $properties[] = $set_properties;
}
$checked = [];
$check_prop = q("SELECT `prop_id` FROM `data_properties` WHERE `data_id` = ".(int)$_GET['id']."");
while ($set_check_prop = $check_prop->fetch_assoc()) {
    $checked[] = $set_check_prop['prop_id'];
}
$check = array_flip($checked);

$module_template = q("
  SELECT `modules`.`id` AS `module_id`, `modules`.`name`, `templates`.`template_id`, `templates`.`template`
  FROM `templates`
  JOIN `modules` ON `modules`.`id` = `templates`.`module_id` AND `templates`.`template` = 'magazine'
  ");

$gallery_data = '';
$gallery = q("SELECT * FROM `gallery` WHERE `data_id` = ".(int)$_GET['id']."");
if($gallery->num_rows) {
    while ($set_gallery = $gallery->fetch_assoc()) {
        $gallery_data[] = $set_gallery;
    }
}
$gal_json = json_encode($gallery_data);