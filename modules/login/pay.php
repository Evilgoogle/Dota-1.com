<?php
if(isset($_SESSION['user']['id'], $_GET['id'], $_GET['admission'])) {
    $res = q("SELECT * FROM `buy` WHERE `id` = ".(int)$_GET['id']." LIMIT 1");
    if($res->num_rows) {
        $set = $res->fetch_assoc();
        $label = $set['id'].'-'.$set['price'].'-'.$_SESSION['user']['id'];
    } else {
        redirect('/login');
    }
} else {
    redirect('/login');
}