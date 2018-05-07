<?php
$regist = new \FW\User\Registration;
if(!$regist->activate($_GET['id'],$_GET['hash'])) {
	$_SESSION['def'] = 'Ваш аккаунт уже активирован!';
    redirect("/");
} else {
    $_SESSION['info'] = 'Активация прошла успешно';
    redirect("/");
}
