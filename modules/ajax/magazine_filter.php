<?php
if(isset($_POST['prop_id'])) {
    $row = q("SELECT `data_id` FROM `data_properties` WHERE `prop_id` = ".(int)$_POST['prop_id']."");
    while($set = $row->fetch_assoc()) {
        $cat[] = $set;
    }
    echo 'dovahkin'.json_encode($cat).'go';
} elseif(isset($_POST['data_id'])) {
    $row = q("SELECT * FROM `data_properties` WHERE `data_id` = ".(int)$_POST['data_id']."");
    while($set = $row->fetch_assoc()) {
        $cat[] = $set;
    }
    echo 'dovahkin'.json_encode($cat).'go';
} elseif (isset($_POST['ids'])) {
    $row = q("SELECT * FROM `data` WHERE `id` IN(".$_POST['ids'].")");
    while($set = $row->fetch_assoc()) {
        $data[] = $set;
    }
    echo 'dovahkin'.json_encode($data).'go';
} elseif (isset($_POST['template_id'])) {
    $row = q("SELECT * FROM `data` WHERE `template_id` = ".(int)$_POST['template_id']."");
    while($set = $row->fetch_assoc()) {
        $data[] = $set;
    }
    echo 'dovahkin'.json_encode($data).'go';
}