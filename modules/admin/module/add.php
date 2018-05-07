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

    if($_POST['parent'] == 0) {
        $modules_limit = q("SELECT `id` FROM `modules` WHERE `parent` = 0");
        if($modules_limit->num_rows == 10) {
            $error['parent'] = 'Нельзя больше добавлять главные модули. В базе уже есть 10 шт главных модулей';
        }
    }

    if(!count($error)) {
        try {
            \MyLibs\HasModule::name($_POST['name']);
            \MyLibs\HasModule::seoUrl($_POST['seo_url']);
            \MyLibs\HasModule::folder($_POST['seo_url']);
            $module = new \Module\Installer();
            $module->set_sitemap($_POST['seo_url']);
            $module->set_module($_POST['seo_url']);
            $module->set_view(($_POST['seo_url']));
        } catch (Exception $e) {
            $error['module'] = 'Не удалось создать модуль. Причина - '.$e.'';
        }
    }

    if (!count($error)) {
        q("INSERT INTO `modules` SET
            `parent`      = '".es($_POST['parent'])."',
			`href`        = '".es($module->module_url)."',
			`img`         = '".es($_POST['name'])."',
			`name`        = '".es($_POST['name'])."',
			`seo_url`     = '".es($_POST['seo_url'])."',
			`meta_title`  = '".es($_POST['meta_title'])."',
			`meta_des`    = '".es($_POST['meta_des'])."',
			`meta_key`    = '".es($_POST['meta_key'])."'
		");
        $module_id = \DB::_()->insert_id;
        foreach($_POST['data'] as $control=>$array) {
            foreach ($array as $key=>$val) {
                foreach ($val as $k=>$v) {
                    if(empty($v['view'])) {
                        $view = 'none';
                    } else {
                        $view = $v['view'];
                    }
                    q("INSERT INTO `templates` SET
                        `module_id` = ".(int)$module_id.",
                        `template`  = '".es($k)."',
                        `view`      = '".es($view)."',
                        `container` = '".es($v['container'])."',
                        `itemscope` = '".es($v['itemscope'])."',
                        `tegh`      = '".es($v['tegh'])."',
                        `header`    = '".es($v['header'])."'
                    ");
                    $template_id = \DB::_()->insert_id;
                    if($k == 'table' || $k == 'gal') {
                        if(isset($v['subcat'])) {
                            foreach ($v['subcat'] as $cat) {
                                q("INSERT INTO `cat` SET
                                `module_id`    = ".(int)$module_id.",
                                `template_id`  = ".(int)$template_id.",
                                `cat`          = '".es($cat)."'
                            ");
                            }
                        }
                    } elseif($k == 'magazine') {
                        if(isset($v['subcat'], $v['properties'])) {
                            foreach ($v['subcat'] as $subcat_id=>$cat) {
                                q("INSERT INTO `cat` SET
                                    `module_id`    = ".(int)$module_id.",
                                    `template_id`  = ".(int)$template_id.",
                                    `cat`          = '".es($cat)."'
                                ");
                                $cat_id_arr[$subcat_id] = \DB::_()->insert_id;
                            }
                            foreach ($v['properties'] as $cat_id=>$properties) {
                                foreach ($cat_id_arr as $key=>$insert_cat) {
                                    foreach ($properties as $item) {
                                        if($cat_id == $key) {
                                            q("INSERT INTO `cat_properties` SET
                                              `cat_id`      = ".(int)$insert_cat.",
                                              `properties`  = '".es($item)."'
                                            ");
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if($k == 'one') {
                        q("INSERT INTO `data` SET
                            `module_id`    = ".(int)$module_id.",
                            `template_id`  = ".(int)$template_id.",
                            `des`          = '',
                            `text`         = '".es($v['text'])."',
                            `date`         = NOW(),
                            `itemprop_text`     = '".es($v['itemprop'])."'
                        ");
                    }
                }
            }
        }

        $_SESSION['info'] = 'Модуль успешно добавлен';
        redirect("/admin/module");
    }
}

if($_SESSION['user']['role'] == 'admin') {
    $row = q("SELECT `id`, `name` FROM `modules`");
} else {
    $_SESSION['def'] = 'У вас нет прав доступа';
    redirect('/admin');
}