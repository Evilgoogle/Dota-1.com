<?php
if(isset($_POST['id'])) {
    q("UPDATE `data` SET `cat` = 0 WHERE `cat` = ".(int)$_POST['id']."");
    q("DELETE FROM `cat` WHERE `id` = ".(int)$_POST['id']."");
}