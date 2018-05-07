<?php
if(isset($_POST['id'])) {
    $row = q("SELECT * FROM `gallery` WHERE `id` = ".(int)$_POST['id']."");
    while ($set = $row->fetch_assoc()) {
        @unlink('.'.$set['mini']);
        @unlink('.'.$set['preview']);
        @unlink('.'.$set['img']);
    }
    q("DELETE FROM `gallery` WHERE `id` = ".(int)$_POST['id']."");
}