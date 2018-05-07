<?php
if (isset($_POST['ok'], $_POST['name'], $_POST['seo_url'], $_POST['meta_title'], $_POST['meta_des'], $_POST['meta_key'], $_POST['parent'])) {

    $_POST['name']       = trimALL($_POST['name']);
    $_POST['seo_url']    = trimALL($_POST['seo_url']);
    $_POST['meta_title'] = trimALL($_POST['meta_title']);
    $_POST['meta_des']   = trimALL($_POST['meta_des']);
    $_POST['meta_key']   = trimALL($_POST['meta_key']);

    $error = array();

    if (empty($_POST['name'])) {
        $error['name'] = 'Вы не ввели - Названия модуля';
    }

    if (empty($_POST['seo_url'])) {
        $error['seo_url'] = 'Вы не ввели - SEO URL';
    } elseif(!preg_match('#^[a-z_0-9]*$#ui', $_POST['seo_url'])) {
        $error['seo_url'] = 'В SEO URL можно вводить только латинские буквы, цифры и знак _';
    }

    if (empty($_POST['meta_title'])) {
        $error['meta_title'] = 'Вы не ввели - Meta Title';
    }

    if (empty($_POST['meta_des'])) {
        $error['meta_des'] = 'Вы не ввели - Meta Description';
    }

    if (empty($_POST['meta_key'])) {
        $error['meta_key'] = 'Вы не ввели - Meta Keywords';
    }

    if(empty($_POST['data'])) {
        $error['data'] = 'Вы не выбрали шаблон. Должно быть хотя бы 1 один';
    }

    if($_POST['parent'] == $_GET['id']) {
        $_POST['parent'] = 0;
    }

    if(!count($error)) {
        try {
            if($_POST['hasname'] !== $_POST['name']) {
                \MyLibs\HasModule::name($_POST['name']);
            }
            if($_POST['hasseo_url'] !== $_POST['seo_url']) {
                \MyLibs\HasModule::seoUrl($_POST['seo_url']);
                \MyLibs\HasModule::folder($_POST['seo_url']);
                $module = new \Module\Installer();
                $module->set_sitemap($_POST['seo_url']);
                $module->set_module($_POST['seo_url']);
                $module->set_view(($_POST['seo_url']));
                \Module\Uninstall::removeDirectory('./modules/'.$_POST['hasseo_url']);
            }
        } catch (Exception $e) {
            $error['module'] = 'Не удалось редактировать модуль. Причина - '.$e.'';
        }
    }

    if (!count($error)) {
        q("UPDATE `modules` SET
            `parent`      = '".es($_POST['parent'])."',
            `href`        = '/".es($_POST['seo_url'])."',
			`img`         = '".es($_POST['name'])."',
			`name`        = '".es($_POST['name'])."',
			`seo_url`     = '".es($_POST['seo_url'])."',
			`meta_title`  = '".es($_POST['meta_title'])."',
			`meta_des`    = '".es($_POST['meta_des'])."',
			`meta_key`    = '".es($_POST['meta_key'])."'
			WHERE `id`    = '".(int)$_GET['id']."'
		");
        foreach($_POST['data'] as $control=>$array) {
            foreach ($array as $key=>$val) {
                foreach ($val as $k=>$v) {
                    if(empty($v['view'])) {
                        $view = 'none';
                    } else {
                        $view = $v['view'];
                    }

                    if($control == 'insert') {
                        q("INSERT INTO `templates` SET
                                `module_id` = ".(int)$_GET['id'].",
                                `template`  = '".es($k)."',
                                `view`      = '".es($view)."',
                                `container` = '".es($v['container'])."',
                                `itemscope` = '".es($v['itemscope'])."',
                                `tegh`      = '".es($v['tegh'])."',
                                `header`    = '".es($v['header'])."'
                            ");
                        $template_id = \DB::_()->insert_id;
                    } elseif($control == 'edit') {
                        q("UPDATE `templates` SET
                            `module_id` = ".(int)$_GET['id'].",
                            `template`  = '".es($k)."',
                            `view`      = '".es($view)."',
                            `container` = '".es($v['container'])."',
                            `itemscope` = '".es($v['itemscope'])."',
                            `tegh`      = '".es($v['tegh'])."',
                            `header`    = '".es($v['header'])."'
                            WHERE `template_id` = '".(int)$key."'
                        ");
                    }
                    if($k == 'table' || $k == 'gal') {
                        if(isset($v['subcat'])) {
                            foreach ($v['subcat'] as $cat_id=>$cat) {
                                if($control == 'insert') {
                                    q("INSERT INTO `cat` SET
                                        `module_id`    = ".(int)$_GET['id'].",
                                        `template_id`  = ".(int)$template_id.",
                                        `cat`          = '".es($cat)."'
                                     ");
                                } elseif($control == 'edit') {
                                    q("UPDATE `cat` SET
                                        `cat`          = '".es($cat)."'
                                        WHERE `id` = '".(int)$cat_id."'
                                     ");
                                } elseif($control == 'edit_insert') {
                                    q("INSERT INTO `cat` SET
                                        `module_id`    = ".(int)$_GET['id'].",
                                        `template_id`  = ".(int)$key.",
                                        `cat`          = '".es($cat)."'
                                     ");
                                }
                            }
                        }
                    } elseif($k == 'magazine') {
                        if(isset($v['subcat'])) {
                            foreach ($v['subcat'] as $subcat_id => $cat) {
                                if ($control == 'insert') {
                                    q("INSERT INTO `cat` SET
                                        `module_id`    = " . (int)$_GET['id'] . ",
                                        `template_id`  = " . (int)$template_id . ",
                                        `cat`          = '" . es($cat) . "'
                                     ");
                                    $cat_id_arr[$subcat_id] = \DB::_()->insert_id;
                                } elseif ($control == 'edit') {
                                    q("UPDATE `cat` SET
                                        `cat`          = '" . es($cat) . "'
                                        WHERE `id` = '" . (int)$subcat_id . "'
                                     ");
                                    $cat_id_arr[$subcat_id] = $subcat_id;
                                } elseif ($control == 'edit_insert') {
                                    q("INSERT INTO `cat` SET
                                        `module_id`    = " . (int)$_GET['id'] . ",
                                        `template_id`  = " . (int)$key . ",
                                        `cat`          = '" . es($cat) . "'
                                     ");
                                    $cat_id_arr[$subcat_id] = \DB::_()->insert_id;
                                }
                            }
                        }
                    }
                    if($k = 'magazine') {
                        if(isset($v['properties'])) {
                            foreach ($v['properties'] as $cat_id => $properties) {
                                foreach ($cat_id_arr as $key => $insert_cat) {
                                    foreach ($properties as $property_id=>$item) {
                                        if ($cat_id == $key) {
                                            if ($control == 'insert') {
                                                q("INSERT INTO `cat_properties` SET
                                                    `cat_id`      = " . (int)$insert_cat . ",
                                                    `properties`  = '" . es($item) . "'
                                                ");
                                            } elseif ($control == 'edit') {
                                                q("UPDATE `cat_properties` SET
                                                    `properties`  = '" . es($item) . "'
                                                    WHERE `id`    = '" . (int)$property_id . "'
                                                ");
                                            } elseif ($control == 'edit_insert') {
                                                q("INSERT INTO `cat_properties` SET
                                                      `cat_id`      = " . (int)$insert_cat . ",
                                                      `properties`  = '" . es($item) . "'
                                                ");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ($k == 'one') {
                        if($control == 'insert') {
                            q("INSERT INTO `data` SET
                                `module_id`    = ".(int)$_GET['id'].",
                                `template_id`  = ".(int)$template_id.",
                                `text`         = '".es($v['text'])."',
                                `date`         = NOW(),
                                `itemprop`     = '".es($v['itemprop'])."'
                             ");
                        } elseif($control == 'edit') {
                            q("UPDATE `data` SET
                                `text`         = '".es($v['text'])."',
                                `date`         = NOW(),
                                `itemprop`     = '".es($v['itemprop'])."'
                                WHERE `template_id` = '".(int)$key."'
                             ");
                        }
                    }
                }
            }
        }

        $_SESSION['info'] = 'Модуль успешно отредактирован';
        redirect("/admin/module");
    }
}

if($_SESSION['user']['role'] == 'admin') {
    $row = q("SELECT * FROM `modules` WHERE `id` = ".(int)$_GET['id']."");
    $set = $row->fetch_assoc();
    $template_data = '';
    $template_cat = '';
    $properties_arr = '';

    $template = q("SELECT `templates`.`template_id`,`templates`.`template`, `templates`.`view`, `templates`.`container`, `templates`.`itemscope`, `templates`.`tegh`, `templates`.`header`, `data`.`text` FROM `templates` LEFT JOIN `data` ON `templates`.`template_id` = `data`.`template_id` AND `templates`.`template` = 'one' WHERE `templates`.`module_id` = ".(int)$_GET['id']."");
    if($template->num_rows) {
        while ($set_template = $template->fetch_assoc()) {
            $template_data[] = $set_template;
        }
    }
    $data_json = json_encode($template_data);

    $cat = q("SELECT * FROM `cat` WHERE `module_id` = ".(int)$_GET['id']."");
    if($cat->num_rows) {
        while($set_cat = $cat->fetch_assoc()) {
            $template_cat[] = $set_cat;
        }
        foreach ($template_cat as $propt) {
            $properties = q("SELECT * FROM `cat_properties` WHERE `cat_id` = ".(int)$propt['id']."");
            while($set_properties = $properties->fetch_assoc()) {
                $properties_arr[] = $set_properties;
            }
        }
    }
    $properties_json = json_encode($properties_arr);
    $cat_json = json_encode($template_cat);

    $parent = q("SELECT `id`, `name` FROM `modules`");
} else {
    $_SESSION['def'] = 'У вас нет прав доступа';
    redirect('/admin');
}