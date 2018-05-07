<?php
if(isset($_GET['id'])) {
    $row = q("SELECT * FROM `modules` WHERE `parent` = ".(int)$_GET['id']."");
    while($set = $row->fetch_assoc()) {
        $data[] = $set;
    }
    echo 'dovahkin'.json_encode($data).'go';
}