<?php
if(isset($_POST['ok'], $_POST['login'],$_POST['pass'])) {
    $auth = new \FW\User\Authorization;
    if($auth->authByLoginPass($_POST['login'],$_POST['pass'],isset($_POST['remember']) ? true : false)) {
        q("UPDATE `orders` SET `user_id` = ".(int)$_SESSION['user']['id']." WHERE `user_id` = '".es($_COOKIE['buy'])."'");
        setcookie('buy', $_SESSION['user']['id'], time ()+3600*10, '/');
        if(isset($_POST['goods'])) {
            redirect('/shop');
        } else {
            redirect($_GET['route']);
        }
    } else {
        $error = $auth->getErrorMess();
        $_SESSION['wrong-form']['time'] = time();
        $_SESSION['wrong-form']['key'] = (isset($_SESSION['wrong-form']['key']) ? ($_SESSION['wrong-form']['key']+1) : 1);
    }
}

if(isset($_SESSION['user']['id'])) {
    $res = q("SELECT `data`.*, `templates`.`template`, `templates`.`header`, `modules`.`name` as `module_name`
        FROM `data`
        JOIN `templates` ON `templates`.`template_id` = `data`.`template_id`
        JOIN `modules` ON `data`.`module_id` = `modules`.`id`
        WHERE `data`.`author` = '".es($_SESSION['user']['login'])."'
    ");
    $good = q("SELECT * FROM `buy` WHERE `user_id` = ".(int)$_SESSION['user']['id']."");
}
