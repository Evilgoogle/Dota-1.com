<?php
if(isset($_POST['id'])) {
    q("DELETE FROM `templates` WHERE `template_id` = ".(int)$_POST['id']."");
    q("DELETE FROM `data` WHERE `template_id` = ".(int)$_POST['id']."");
    $row = q("SELECT `id` FROM `cat` WHERE `template_id` = ".(int)$_POST['id']."");
    q("DELETE FROM `cat` WHERE `template_id` = ".(int)$_POST['id']."");
    while($set = $row->fetch_assoc()) {
        q("DELETE FROM `cat_properties` WHERE `cat_id` = ".(int)$set['id']."");
    }
}