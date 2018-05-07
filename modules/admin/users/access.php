<?php
if (isset($_POST['ok'], $_POST['access'])) {
    q("UPDATE `fw_users` SET 
	    `role` = '".es($_POST['access'])."' 
		WHERE `id`='".(int)$_GET['id']."'"
    );
    $_SESSION['info'] = 'Права успешно установлены';
    header('Location: /admin/users/');
    exit();
}

$row = q("SELECT * FROM `fw_users` WHERE `id` = ".(int)$_GET['id']." LIMIT 1");
$set = $row->fetch_assoc();