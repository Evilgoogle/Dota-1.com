<?php
if(isset($_POST['del'])) {
    if (isset($_POST['ids'])) {
        $_POST['ids'] = intALL($_POST['ids'],1);
        $ids = implode(',', $_POST['ids']);

        $select = q("SELECT * FROM `modules` WHERE `id` IN (".$ids.")");
        while($set_select = $select->fetch_assoc()) {
            $delete_folder[] = $set_select;
        }

        // Delete Folder
        foreach ($delete_folder as $folder) {
            try {
                \Module\Uninstall::removeDirectory('./modules/'.$folder['href']);
            } catch (Exception $e) {
                $_SESSION['def'] = $e;
            }
        }

        // Delete Data
        q("DELETE FROM `modules` WHERE `id` IN (".$ids.")");
        q("DELETE FROM `templates` WHERE `module_id` IN (".$ids.")");
        $del_imgs = q("SELECT `id`, `mini`, `preview`, `img` FROM `data` WHERE `module_id` IN (".$ids.")");
        while ($set_del_imgs = $del_imgs->fetch_assoc()) {
            $imgs_data[] = $set_del_imgs;
        }
        foreach ($imgs_data as $del_img) {
            @unlink('.'.$del_img['mini']);
            @unlink('.'.$del_img['preview']);
            @unlink('.'.$del_img['img']);
        }
        foreach ($imgs_data as $magazine_img) {
            $del_magazine_imgs = q("SELECT `mini`, `preview`, `img` FROM `gallery` WHERE `data_id` = ".(int)$magazine_img['id']."");
            while ($set_del_magazine_imgs = $del_magazine_imgs->fetch_assoc()) {
                @unlink('.'.$set_del_magazine_imgs['mini']);
                @unlink('.'.$set_del_magazine_imgs['preview']);
                @unlink('.'.$set_del_magazine_imgs['img']);
            }
        }
        foreach ($imgs_data as $gallery) {
            q("DELETE FROM `gallery` WHERE `data_id` = ".(int)$gallery['id']."");
        }
        q("DELETE FROM `data` WHERE `module_id` IN (".$ids.")");
        $del = q("SELECT `id` FROM `cat` WHERE `module_id` IN (".$ids.")");
        q("DELETE FROM `cat` WHERE `module_id` IN (".$ids.")");
        while($set_del = $del->fetch_assoc()) {
            q("DELETE FROM `cat_properties` WHERE `cat_id` = ".(int)$set_del['id']."");
        }

        //Delete Child
        foreach ($delete_folder as $child) {
            \Module\Uninstall::removeModule($child['id']);
        }

        $_SESSION['info'] = 'Удаление прошла успешно';
        header ('Location: /admin/module');
        exit();
    } else {
        $_SESSION['def'] = 'Отметьте то чего хотите удалить';
    }
}

if($_SESSION['user']['role'] == 'admin') {
    $modules = q("SELECT * FROM `modules` WHERE `parent` = 0");
} else {
    $_SESSION['def'] = 'У вас нет прав доступа';
    redirect('/admin');
}
