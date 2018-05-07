<?php
namespace Module;

class Uninstall
{
    static function removeDirectory($dir) {
        if(preg_match('#^\.\/modules\/$#iu', $dir)) {
            throw new \Exception('Ошибка удаление. Корневую папку Modules нельзя удалить');
        } else {
            if(file_exists($dir)) {
                if ($objs = glob($dir."/*")) {
                    foreach($objs as $obj) {
                        is_dir($obj) ? \Module\Uninstall::removeDirectory($obj) : unlink($obj);
                    }
                }
                rmdir($dir);
            }
        }
    }

    static function removeModule($id) {
        $row = q("SELECT * FROM `modules` WHERE `parent` = ".(int)$id."");
        if($row->num_rows) {
            while ($set = $row->fetch_assoc()) {
                // Delete Folder
                $select = q("SELECT `href` FROM `modules` WHERE `id` = ".(int)$set['id']." LIMIT 1");
                $set_select = $select->fetch_assoc();
                \Module\Uninstall::removeDirectory('./modules/'.$set_select['href']);

                // Delete Data
                q("DELETE FROM `modules` WHERE `id` = ".(int)$set['id']."");
                q("DELETE FROM `templates` WHERE `module_id` = ".(int)$set['id']."");
                $del_imgs = q("SELECT `id`, `mini`, `preview`, `img` FROM `data` WHERE `module_id` = ".(int)$set['id']."");
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
                q("DELETE FROM `data` WHERE `module_id` = ".(int)$set['id']."");
                $del = q("SELECT `id` FROM `cat` WHERE `module_id` = ".(int)$set['id']."");
                q("DELETE FROM `cat` WHERE `module_id` = ".(int)$set['id']."");
                while($set_del = $del->fetch_assoc()) {
                    q("DELETE FROM `cat_properties` WHERE `cat_id` = ".(int)$set_del['id']."");
                }
                \Module\Uninstall::removeModule($set['id']);
            }
        }
    }
}