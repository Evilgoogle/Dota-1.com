<?php
if (isset($_POST['ok'], $_POST['name'])) {

    $_POST['name'] = trimALL($_POST['name']);
    $_POST['des'] = trimALL($_POST['des']);
    $_POST['text'] = trimALL($_POST['text']);
    $_POST['itemprop_pic']   = trimALL($_POST['itemprop_pic']);
    $_POST['itemprop_name']  = trimALL($_POST['itemprop_name']);
    $_POST['itemprop_des']   = trimALL($_POST['itemprop_des']);
    $_POST['itemprop_text']  = trimALL($_POST['itemprop_text']);
    $_POST['itemprop_date']  = trimALL($_POST['itemprop_date']);
    $_POST['itemprop_views'] = trimALL($_POST['itemprop_views']);
    $_POST['itemprop_url']   = trimALL($_POST['itemprop_url']);

    $error = array();

    if (empty($_POST['name'])) {
        $error['name'] = 'Вы не ввели - названия';
    }

    $mod_temp = explode(',',$_POST['module_template']);

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
                        $name = date('Ymd-his') . 'table-'. $img_key_upl . rand(100000, 999999) . '.jpg';
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
                        $upload_preview->minwidth = 179;
                        $upload_preview->minheight = 186;
                        $upload_preview->save_origin = false;
                        $name_preview = date('Ymd-his') . 'table-' . $img_key_upl . '' . rand(100000, 999999) . '.jpg';
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
                            $del_preview = q("SELECT `preview` FROM `data` WHERE `id` = " . (int)$_GET['id'] . "");
                            $set_preview_del = $del_preview->fetch_assoc();
                            @unlink('.' . $set_preview_del['preview']);
                            if ($img_key == 'preview') {
                                $upload_preview->load();
                                $upload_preview->resize(179, 186, 'mini');
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
			`cat`          = '".(int)$_POST['subcat']."',
			`name`         = '".es($_POST['name'])."',
			`des`          = '".es($_POST['des'])."',
			`text`         = '".es($_POST['text'])."',
			`date`         = NOW(),
			`mini`         = '".es($uploded_mini)."',
			`preview`      = '".es($uploded_preview)."',
			`itemprop_pic`     = '".es($_POST['itemprop_pic'])."',
			`itemprop_name`    = '".es($_POST['itemprop_name'])."',
			`itemprop_des`     = '".es($_POST['itemprop_des'])."',
			`itemprop_text`    = '".es($_POST['itemprop_text'])."',
			`itemprop_date`    = '".es($_POST['itemprop_date'])."',
			`itemprop_views`   = '".es($_POST['itemprop_views'])."',
			`itemprop_url`     = '".es($_POST['itemprop_url'])."'
			WHERE `id`     = '".(int)$_GET['id']."'
		");

        $_SESSION['info'] = 'Запись успешно отредактировано';
        redirect("/".$_POST['module_name']."");
    }

}

if(isset($_SESSION['user'])) {
    if ($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {
        ////////////////
        if(isset($_GET['id'], $_GET['module_id'], $_GET['template_id'], $_GET['template'], $_GET['module_name'])) {
            $data = q("SELECT * FROM `data` WHERE `id` = ".(int)$_GET['id']." LIMIT 1");
            if (!mysqli_num_rows($data)) {
                $_SESSION['info'] = 'Данная запись не существует';
                header("location: /".$_POST['module_name']."");
                exit();
            } else {
                $set_data = $data->fetch_assoc();
            }
            $subcat = q("SELECT * FROM `cat` WHERE `template_id` = ".(int)$_GET['template_id']."");
            $module_template = q("
              SELECT `modules`.`id` AS `module_id`, `modules`.`name`, `templates`.`template_id`, `templates`.`template`
              FROM `templates`
              JOIN `modules` ON `modules`.`id` = `templates`.`module_id` AND `templates`.`template` = 'table'
              ");
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