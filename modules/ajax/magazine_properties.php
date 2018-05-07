<?php
if(isset($_POST['activate'])) {
    $row = q("SELECT * FROM `cat_properties`");
    while($set = $row->fetch_assoc()) {
        $cat[] = $set;
    }
    echo 'dovahkin'.json_encode($cat).'go';
}