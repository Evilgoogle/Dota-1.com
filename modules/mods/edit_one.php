<?php
if (isset($_POST['ok'], $_POST['text'])) {

    $_POST['text'] = trimALL($_POST['text']);
    $mod_temp = explode(',',$_POST['module_template']);

    q("UPDATE `data` SET
			`module_id`    = '".(int)$mod_temp[0]."',
			`template_id`  = '".(int)$mod_temp[1]."',
			`cat`          = 0,
			`text`         = '".es($_POST['text'])."',
			`date`         = NOW()
			WHERE `id`     = '".(int)$_GET['id']."'
	");

    $_SESSION['info'] = 'Запись успешно отредактировано';
    redirect("/".$_POST['module_name']."");
}

if(isset($_SESSION['user'])) {
    if ($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {
        ////////////////
        if(isset($_GET['id'], $_GET['module_id'], $_GET['template_id'], $_GET['template'], $_GET['module_name'])) {
            $data = q("SELECT * FROM `data` WHERE `id` = " . (int)$_GET['id'] . " LIMIT 1");
            if (!mysqli_num_rows($data)) {
                $_SESSION['info'] = 'Данная запись не существует';
                header("location: /" . $_POST['module_name'] . "");
                exit();
            } else {
                $set_data = $data->fetch_assoc();
            }
            $subcat = q("SELECT * FROM `cat` WHERE `template_id` = " . (int)$_GET['template_id'] . "");
            $module_template = q("
              SELECT `modules`.`id` AS `module_id`, `modules`.`name`, `templates`.`template_id`, `templates`.`template`
              FROM `templates`
              JOIN `modules` ON `modules`.`id` = `templates`.`module_id` AND `templates`.`template` = 'one'
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