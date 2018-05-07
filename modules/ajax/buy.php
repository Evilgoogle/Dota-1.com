<?php
if(isset($_POST['order_id'], $_POST['user_id'])) {
    $res = q("SELECT `id` FROM `orders` WHERE `data_id` = ".(int)$_POST['order_id']." AND `user_id` = '".es($_POST['user_id'])."'");
    if($res->num_rows) {
        if(!isset($_COOKIE['buy'])) {
            setcookie('buy', $_POST['user_id'], time ()+3600*10, '/');
        }
    } else {
        q("INSERT INTO `orders` SET
            `data_id`  = ".(int)$_POST['order_id'].",
            `user_id`  = '".es($_POST['user_id'])."'
        ");
        setcookie('buy', $_POST['user_id'], time ()+3600*10, '/');
    }
} elseif(isset($_POST['order_del_id'], $_POST['user_del_id'])) {
    $res = q("SELECT `id` FROM `orders` WHERE `data_id` = ".(int)$_POST['order_del_id']." AND `user_id` = '".es($_POST['user_del_id'])."'");
    if($res->num_rows) {
        if(isset($_COOKIE['buy'])) {
            setcookie('buy', $_POST['user_id'], time ()-3600*10, '/');
        }
        q("DELETE FROM `orders` WHERE `data_id` = ".(int)$_POST['order_del_id']." AND `user_id` = '".es($_POST['user_del_id'])."'");
    }
}