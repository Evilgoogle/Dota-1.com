<?php
if(isset($_POST['id'])) {
    q("DELETE FROM `cat_properties` WHERE `cat_id` = ".(int)$_POST['id']."");
    q("DELETE FROM `cat` WHERE `id` = ".(int)$_POST['id']."");
}