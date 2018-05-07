<?php
if(isset($_GET['id'], $_GET['template_id'])) {
    $row = q("SELECT * FROM `data` WHERE `cat` = ".(int)$_GET['id']." AND `template_id` = ".(int)$_GET['template_id']."");
    while($set = $row->fetch_assoc()) {
        $data[] = $set;
    }
    echo 'dovahkin'.json_encode($data).'go';
}