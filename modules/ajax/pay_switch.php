<?php
if(isset($_POST['id'], $_POST['pay_switch'])) {
    if($_POST['pay_switch'] == 'cash') {
        $switch = 'Наличными';
        q("UPDATE `buy` SET `admission` = '".es($switch)."' WHERE `id` = ".(int)$_POST['id']."");
        echo 'dovahkin1go';
    } else if($_POST['pay_switch'] == 'transfer'){
        $switch = 'Перевод';
        q("UPDATE `buy` SET `admission` = '".es($switch)."' WHERE `id` = ".(int)$_POST['id']."");
        echo 'dovahkin1go';
    }
}