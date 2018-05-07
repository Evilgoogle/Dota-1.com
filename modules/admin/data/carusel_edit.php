<?php
if (isset($_POST['ok'], $_POST['name'])) {

    $_POST['name'] = trimALL($_POST['name']);
    $_POST['itemprop_pic']   = trimALL($_POST['itemprop_pic']);
    $_POST['itemprop_url']   = trimALL($_POST['itemprop_url']);

    $error = array();

    if (empty($_POST['name'])) {
        $error['name'] = 'Вы не ввели - названия';
    }

    $mod_temp = explode(',',$_POST['module_template']);

    if($mod_temp[1] != $_GET['template_id']) {
        $count = q("SELECT `id` FROM `data` WHERE `module_id` = ".(int)$mod_temp[0]." AND `template_id` = ".(int)$mod_temp[1]."");
        if($count->num_rows >= 6) {
            $error['count'] = 'Количества картин в выбранном шаблоне "Карусельный шаблон -'.$mod_temp[1].'" превышает 6 шт';
        }
    }

    if (!count($error)) {

        $test_mini = 'ok';
        $test_preview = 'ok';
        if (isset($_POST['img'])) {
            foreach ($_POST['img'] as $img_key_upl => $img_val_upl) {
                if (array_key_exists('mini', $_POST['img'])) {
                    if ($img_key_upl == 'mini') {
                        $upload = new \MyLibs\Uploader();
                        $upload->minwidth = 64;
                        $upload->minheight = 64;
                        $upload->save_origin = false;
                        $name = date('Ymd-his') . 'carusel-'. $img_key_upl . rand(100000, 999999) . '.jpg';
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
                if (array_key_exists('preview', $_POST['img'])) {
                    if ($img_key_upl == 'preview') {
                        $upload_preview = new \MyLibs\Uploader();
                        $upload_preview->minwidth = 704;
                        $upload_preview->minheight = 433;
                        $upload_preview->save_origin = false;
                        $name_preview = date('Ymd-his') . 'carusel-' . $img_key_upl . '' . rand(100000, 999999) . '.jpg';
                        try {
                            $file_preview = $upload_preview->cropUpload($img_key_upl, $img_val_upl, $name_preview);
                            $upload_preview->hasResize();
                            $test_preview = 'ok';
                        } catch (Exception $e) {
                            $error['preview'] = 'Превью картина - ' . $e;
                            $test_preview = 'error';
                        }
                    }
                }
            }
        }

        $mini_pic_uploaded = 'error';
        $preview_pic_uploaded = 'error';
        if ($test_mini == 'ok') {
            if ($test_preview == 'ok') {
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
                        if (array_key_exists('preview', $_POST['img'])) {
                            $del_preview = q("SELECT `img` FROM `data` WHERE `id` = " . (int)$_GET['id'] . "");
                            $set_preview_del = $del_preview->fetch_assoc();
                            @unlink('.' . $set_preview_del['img']);
                            if ($img_key == 'preview') {
                                $upload_preview->load();
                                $upload_preview->resize(704, 433, 'mini');
                                $preview_pic_uploaded = 'ok';
                            }
                        }
                    }
                }
            }
        }
    }

    $uploded_mini = ($mini_pic_uploaded == 'ok') ? $upload->refilename : $_POST['preview_mini'];
    $uploded_preview = ($preview_pic_uploaded == 'ok') ? $upload_preview->refilename : $_POST['preview_preview'];

    if (!count($error)) {
        q("UPDATE `data` SET
			`module_id`    = '".(int)$mod_temp[0]."',
			`template_id`  = '".(int)$mod_temp[1]."',
			`name`         = '".es($_POST['name'])."',
			`des`          = '',
			`text`         = '".es($_POST['text'])."',
			`date`         = NOW(),
			`mini`         = '".es($uploded_mini)."',
			`img`          = '".es($uploded_preview)."',
			`itemprop_pic`     = '".es($_POST['itemprop_pic'])."',
			`itemprop_url`     = '".es($_POST['itemprop_url'])."'
			WHERE `id`     = '".(int)$_GET['id']."'
		");

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
}
$module_template = q("
  SELECT `modules`.`id` AS `module_id`, `modules`.`name`, `templates`.`template_id`, `templates`.`template`
  FROM `templates`
  JOIN `modules` ON `modules`.`id` = `templates`.`module_id` AND `templates`.`template` = 'carusel'
  ");