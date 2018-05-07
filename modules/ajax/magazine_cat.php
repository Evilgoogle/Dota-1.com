<?php
if(isset($_POST['template_id'])) {
    $row = q("SELECT * FROM `cat` WHERE `template_id` = ".(int)$_POST['template_id']."");
    while($set = $row->fetch_assoc()) {
        $cat[] = $set;
    }
    echo 'dovahkin'.json_encode($cat).'go';
}