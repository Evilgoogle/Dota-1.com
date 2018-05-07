<?php
if(isset($_POST['id'])) {
    q("DELETE FROM `cat_properties` WHERE `id` = ".(int)$_POST['id']."");
}