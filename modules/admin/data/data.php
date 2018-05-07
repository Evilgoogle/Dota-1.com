<?php
if(isset($_POST['one_edit'])) {
    foreach ($_POST['one'] as $key=>$one) {
        q("UPDATE `data` SET
          `text` = '".es($one['text'])."',
          `itemprop_text` = '".es($one['itemprop_text'])."',
          `date` = NOW()
          WHERE `template_id` = ".(int)$key."
        ");
        $_SESSION['info'] = 'Запись успешно отредактирована';
        header("location: /admin/data");
        exit();
    }
}
if(isset($_POST['del'])) {
    if (isset($_POST['ids'])) {
        foreach ($_POST['ids'] as $key=>$val) {
            $val = intALL($val,1);
            $ids = implode(',', $val);
            if($key == 'table') {
                $dell_mini = q("SELECT `mini` FROM `data` WHERE `id` IN (".$ids.")");
                while ($set_dell_mini = $dell_mini->fetch_assoc()) {
                    @unlink('.' . $set_dell_mini['mini']);
                }
                $dell = q("SELECT `preview` FROM `data` WHERE `id` IN (".$ids.")");
                while ($set_dell = $dell->fetch_assoc()) {
                    @unlink('.' . $set_dell['preview']);
                }
                q("DELETE FROM `data` WHERE `id` IN (".$ids.")");
                $_SESSION['info'] = 'Запись успешно удалена';
                header("location: /admin/data");
                exit();
            } elseif($key == 'gal') {
                $dell_mini = q("SELECT `mini` FROM `data` WHERE `id` IN (".$ids.")");
                while ($set_dell_mini = $dell_mini->fetch_assoc()) {
                    @unlink('.' . $set_dell_mini['mini']);
                }
                $dell_pr = q("SELECT `preview` FROM `data` WHERE `id` IN (".$ids.")");
                while ($set_dell_pr = $dell_pr->fetch_assoc()) {
                    @unlink('.' . $set_dell_pr['preview']);
                }
                $dell = q("SELECT `img` FROM `data` WHERE `id` IN (".$ids.")");
                while ($set_dell = $dell->fetch_assoc()) {
                    @unlink('.' . $set_dell['img']);
                }
                q("DELETE FROM `data` WHERE `id` IN (".$ids.")");
                $_SESSION['info'] = 'Запись успешно удалена';
                header("location: /admin/data");
                exit();
            } elseif($key == 'carusel') {
                $dell_mini = q("SELECT `mini` FROM `data` WHERE `id` IN (".$ids.")");
                while ($set_dell_mini = $dell_mini->fetch_assoc()) {
                    @unlink('.' . $set_dell_mini['mini']);
                }
                $dell = q("SELECT `img` FROM `data` WHERE `id` IN (".$ids.")");
                while ($set_dell = $dell->fetch_assoc()) {
                    @unlink('.' . $set_dell['img']);
                }
                q("DELETE FROM `data` WHERE `id` IN (".$ids.")");
                $_SESSION['info'] = 'Запись успешно удалена';
                header("location: /admin/data");
                exit();
            } elseif($key == 'magazine') {
                $dell_mini = q("SELECT `mini` FROM `data` WHERE `id` IN (".$ids.")");
                while ($set_dell_mini = $dell_mini->fetch_assoc()) {
                    @unlink('.' . $set_dell_mini['mini']);
                }
                $dell_galery = q("SELECT * FROM `gallery` WHERE `id` IN (".$ids.")");
                while ($set_dell_galery = $dell_galery->fetch_assoc()) {
                    @unlink('.' . $set_dell_mini['mini']);
                    @unlink('.' . $set_dell_mini['preview']);
                    @unlink('.' . $set_dell_mini['img']);
                }

                q("DELETE FROM `data` WHERE `id` IN (".$ids.")");
                $_SESSION['info'] = 'Запись успешно удалена';
                header("location: /admin/data");
                exit();
            }
        }
    } else {
        $_SESSION['def'] = 'Отметьте то что хотите удалить';
    }
}

$data = [];
$modules = q("SELECT * FROM `modules`");
$get_templates = q("SELECT * FROM `templates`");
$data_get = q("SELECT * FROM `data`");
while($set_templates = $get_templates->fetch_assoc()) {
    $templates[] = $set_templates;
}
while($set_data = $data_get->fetch_assoc()) {
    $data[] = $set_data;
}