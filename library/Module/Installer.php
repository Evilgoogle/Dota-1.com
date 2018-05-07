<?php
namespace Module;

use PHPMailer\PHPMailer\Exception;

class Installer
{
    public $basedir = '.';
    public $module_url;
    private $module_add = '
        <?php
        if(isset($_GET[\'template\'])) {
            if ($_GET[\'template\'] == \'table\') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET[\'template_id\'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template[\'template\'] != \'table\') {
                    redirect("/404");
                } else {
                    include_once(\'./modules/mods/add_table.php\');
                }
            } elseif ($_GET[\'template\'] == \'gal\') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET[\'template_id\'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template[\'template\'] != \'gal\') {
                    redirect("/404");
                } else {
                    include_once(\'./modules/mods/add_gal.php\');
                }
            } elseif ($_GET[\'template\'] == \'carusel\') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET[\'template_id\'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template[\'template\'] != \'carusel\') {
                    redirect("/404");
                    exit();
                } else {
                    include_once(\'./modules/mods/add_carusel.php\');
                }
            } elseif ($_GET[\'template\'] == \'magazine\') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET[\'template_id\'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template[\'template\'] != \'magazine\') {
                    redirect("/404");
                } else {
                    include_once(\'./modules/mods/add_magazine.php\');
                }
            }
        } else {
            redirect("/404");
        }
    ';
    private $module_edit = '
        <?php
        if(isset($_GET[\'template\'])) {
            if ($_GET[\'template\'] == \'one\') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET[\'template_id\'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template[\'template\'] != \'one\') {
                    redirect("/404");
                } else {
                    include_once(\'./modules/mods/edit_one.php\');
                }
            } elseif ($_GET[\'template\'] == \'table\') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET[\'template_id\'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template[\'template\'] != \'table\') {
                    redirect("/404");
                } else {
                    include_once(\'./modules/mods/edit_table.php\');
                }
            } elseif ($_GET[\'template\'] == \'carusel\') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET[\'template_id\'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template[\'template\'] != \'carusel\') {
                    redirect("/404");
                } else {
                    include_once(\'./modules/mods/edit_carusel.php\');
                }
            } elseif ($_GET[\'template\'] == \'magazine\') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET[\'template_id\'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template[\'template\'] != \'magazine\') {
                    redirect("/404");
                } else {
                    include_once(\'./modules/mods/edit_magazine.php\');
                }
            }
        } else {
            redirect("/404");
        }
    ';
    private $module_shop = '
        <?php
        $template = q("SELECT `template` FROM `templates` WHERE `template_id` = ".(int)$_GET[\'template\']."");
        $set_template = $template->fetch_assoc();
        if($set_template[\'template\'] != \'magazine\') {
            redirect("/404");
        }
        
        $row = q("SELECT * FROM `data` WHERE `id` =  \'".(int)$_GET[\'id\']."\'");
        $set = $row->fetch_assoc();
        
        $get_gal = q("SELECT * FROM `gallery` WHERE `data_id` = ".(int)$_GET[\'id\']."");
        while($set_gal = $get_gal->fetch_assoc()) {
            $gal[] = $set_gal;
        }
    ';
    private $module_view = '
        <?php
        $template = q("SELECT `template` FROM `templates` WHERE `template_id` = ".(int)$_GET[\'template\']."");
        $set_template = $template->fetch_assoc();
        if($set_template[\'template\'] != \'table\') {
            redirect("/404");
        }

        $row = q("SELECT * FROM `data` WHERE `id` = ".(int)$_GET[\'id\']."");
        $set = $row->fetch_assoc();
    ';
    private $module_slider = '
        <?php
        $template = q("SELECT `template` FROM `templates` WHERE `template_id` = ".(int)$_GET[\'template\']."");
        $set_template = $template->fetch_assoc();
        if($set_template[\'template\'] != \'carusel\') {
            redirect("/404");
        }
        
        $row = q("SELECT * FROM `data` WHERE `id` = ".(int)$_GET[\'id\']."");
        $set = $row->fetch_assoc();
    ';
    private $skin_add = '
        <?php if($_GET[\'template\'] == \'table\') {
            include_once(\'./skins/templates/add_table.tpl\');
        } elseif($_GET[\'template\'] == \'gal\') {
            include_once(\'./skins/templates/add_gal.tpl\');
        } elseif($_GET[\'template\'] == \'carusel\') {
            include_once(\'./skins/templates/add_carusel.tpl\');
        } elseif($_GET[\'template\'] == \'magazine\') {
            include_once(\'./skins/templates/add_magazine.tpl\');
        } 
    ';
    private $skin_edit = '
        <?php if($_GET[\'template\'] == \'one\') {
	        include_once(\'./skins/templates/edit_one.tpl\');
        } elseif($_GET[\'template\'] == \'table\') {
            include_once(\'./skins/templates/edit_table.tpl\');
        } elseif($_GET[\'template\'] == \'carusel\') {
            include_once(\'./skins/templates/edit_carusel.tpl\');
        } elseif($_GET[\'template\'] == \'magazine\') {
            include_once(\'./skins/templates/edit_magazine.tpl\');
        } 
    ';
    private $skin_shop = '<?php include_once(\'./skins/templates/shop.tpl\');';
    private $skin_view = '<?php include_once(\'./skins/templates/view.tpl\');';
    private $skin_slider = '<?php include_once(\'./skins/templates/slider.tpl\');';

    public function set_sitemap($module) {
        $temp = '<?php
            return [
                \''.$module.'\' => \'\',
                \'add\' => \'\',
                \'edit\' => \'\',
                \'shop\' => \'\',
                \'view\' => \'\',
                \'slider\' => \'\'
            ];';
        if(!file_exists($this->basedir.'/modules/'.$module.'/sitemap/')) {
            if(!mkdir($this->basedir.'/modules/'.$module.'/sitemap/',0775,true)) {
                throw new \Exception('error','Не удалось создать директорию '.$module.'/sitemap. Возможно нет прав на рабочий каталог!');
            } else {
                if (file_put_contents($this->basedir.'/modules/'.$module.'/sitemap/sitemap.php', $temp) === false) {
                    throw new \Exception('Не удалось создать sitemap');
                }
            }
        } else {
            if (file_put_contents($this->basedir.'/modules/'.$module.'/sitemap/sitemap.php', $temp) === false) {
                throw new \Exception('Не удалось создать sitemap');
            }
        }
    }
    public function set_module($module) {
        $temp = '
            <?php
                if(isset($_POST[\'del\'])) {
                    if(isset($_SESSION[\'user\'])) {
                        if ($_SESSION[\'user\'][\'role\'] == \'supermoderator\' || $_SESSION[\'user\'][\'role\'] == \'admin\') {
                            if (isset($_POST[\'ids\'])) {
                                $_POST[\'ids\'] = intALL($_POST[\'ids\'], 1);
                                $ids = implode(\',\', $_POST[\'ids\']);

                                if (key($_POST[\'del\']) == \'table\') {
                                    q("DELETE FROM `data` WHERE `id` IN (" . $ids . ")");
                                    $_SESSION[\'info\'] = \'Удаление прошла успешно\';
                                    foreach ($_POST[\'del\'] as $val) {
                                        header(\'Location: /\' . key($val) . \'\');
                                    }
                                    exit();
                                } elseif (key($_POST[\'del\']) == \'gal\') {
                                    $dell = q("SELECT `img` FROM `data` WHERE `id` IN (" . $ids . ")");
                                    while ($set_dell = $dell->fetch_assoc()) {
                                        @unlink(\'.\' . $set_dell[\'img\']);
                                    }
                                    $dell_pr = q("SELECT `preview` FROM `data` WHERE `id` IN (" . $ids . ")");
                                    while ($set_dell_pr = $dell_pr->fetch_assoc()) {
                                        @unlink(\'.\' . $set_dell_pr[\'preview\']);
                                    }

                                    q("DELETE FROM `data` WHERE `id` IN (" . $ids . ")");
                                    $_SESSION[\'info\'] = \'Удаление прошла успешно\';
                                    foreach ($_POST[\'del\'] as $val) {
                                        header(\'Location: /\' . key($val) . \'\');
                                    }
                                    exit();
                                } elseif (key($_POST[\'del\']) == \'carusel\') {
                                } elseif (key($_POST[\'del\']) == \'magazine\') {
                                }
                            } else {
                                $_SESSION[\'def\'] = \'Отметьте то что хотите удалить\';
                            }
                        } else {
                            $_SESSION[\'def\'] = \'У вас нет прав на удаление\';
                        }
                    } else {
                        $_SESSION[\'def\'] = \'У вас нет прав на удаление\';
                    }
                }
                
                $template = q("SELECT `modules`.`id`, `modules`.`seo_url`, `templates`.`template_id`, `templates`.`template`
                FROM `modules`
                LEFT JOIN `templates` ON `templates`.`module_id` = `modules`.`id`
                WHERE `seo_url` = \'".es($_GET[\'_page\'])."\'");
                
                $loader = new \Page\Loader();
                $factory = new \Page\Factory($loader);
                $loader->factory = $factory;
                
                while($set_model = $template->fetch_assoc()) {
                    $factory->model($set_model[\'id\'], $set_model[\'template_id\'], $set_model[\'template\']);
                    $factory->module = $set_model[\'seo_url\'];
                }
        ';
        if(!file_exists($this->basedir.'/modules/'.$module.'/')) {
            if(!mkdir($this->basedir.'/modules/'.$module.'/',0775,true)) {
                throw new \Exception('Не удалось создать директорию /'.$module.'. Возможно нет прав на рабочий каталог!');
            } else {
                if(file_put_contents($this->basedir.'/modules/'.$module.'/'.$module.'.php', $temp) === false) {
                    throw new \Exception('Не удалось создать module '.$module.'');
                } else {
                    $this->module_url = '/'.$module;
                }
                if(file_put_contents($this->basedir.'/modules/'.$module.'/add.php', $this->module_add) === false) {
                    throw new \Exception('Не удалось создать module '.$module.'/add');
                }
                if(file_put_contents($this->basedir.'/modules/'.$module.'/edit.php', $this->module_edit) === false) {
                    throw new \Exception('Не удалось создать module '.$module.'/edit');
                }
                if(file_put_contents($this->basedir.'/modules/'.$module.'/shop.php', $this->module_shop) === false) {
                    throw new \Exception('Не удалось создать module '.$module.'/shop');
                }
                if(file_put_contents($this->basedir.'/modules/'.$module.'/view.php', $this->module_view) === false) {
                    throw new \Exception('Не удалось создать module '.$module.'/view');
                }
                if(file_put_contents($this->basedir.'/modules/'.$module.'/slider.php', $this->module_slider) === false) {
                    throw new \Exception('Не удалось создать module '.$module.'/slider');
                }
            }
        } else {
            if(file_put_contents($this->basedir.'/modules/'.$module.'/'.$module.'.php', $temp) === false) {
                throw new \Exception('Не удалось создать module '.$module.'');
            } else {
                $this->module_url = '/'.$module;
            }
            if(file_put_contents($this->basedir.'/modules/'.$module.'/add.php', $this->module_add) === false) {
                throw new \Exception('Не удалось создать module '.$module.'/add');
            }
            if(file_put_contents($this->basedir.'/modules/'.$module.'/edit.php', $this->module_edit) === false) {
                throw new \Exception('Не удалось создать module '.$module.'/edit');
            }
            if(file_put_contents($this->basedir.'/modules/'.$module.'/shop.php', $this->module_shop) === false) {
                throw new \Exception('Не удалось создать module '.$module.'/shop');
            }
            if(file_put_contents($this->basedir.'/modules/'.$module.'/view.php', $this->module_view) === false) {
                throw new \Exception('Не удалось создать module '.$module.'/view');
            }
            if(file_put_contents($this->basedir.'/modules/'.$module.'/slider.php', $this->module_slider) === false) {
                throw new \Exception('Не удалось создать module '.$module.'/slider');
            }
        }
    }
    public function set_view($module) {
        $temp = '<?php $factory->view();';
        if(!file_exists($this->basedir.'/modules/'.$module.'/view/')) {
            if(!mkdir($this->basedir.'/modules/'.$module.'/view/',0775,true)) {
                throw new \Exception('Не удалось создать директорию /'.$module.'/view. Возможно нет прав на рабочий каталог!');
            } else {
                if(file_put_contents($this->basedir.'/modules/'.$module.'/view/'.$module.'.tpl', $temp) === false) {
                    throw new \Exception('Не удалось создать skin '.$module.'');
                }
                if(file_put_contents($this->basedir.'/modules/'.$module.'/view/add.tpl', $this->skin_add) === false) {
                    throw new \Exception('Не удалось создать skin '.$module.'/add');
                }
                if(file_put_contents($this->basedir.'/modules/'.$module.'/view/edit.tpl', $this->skin_edit) === false) {
                    throw new \Exception('Не удалось создать skin '.$module.'/edit');
                }
                if(file_put_contents($this->basedir.'/modules/'.$module.'/view/shop.tpl', $this->skin_shop) === false) {
                    throw new \Exception('Не удалось создать skin '.$module.'/shop');
                }
                if(file_put_contents($this->basedir.'/modules/'.$module.'/view/view.tpl', $this->skin_view) === false) {
                    throw new \Exception('Не удалось создать skin '.$module.'/view');
                }
                if(file_put_contents($this->basedir.'/modules/'.$module.'/view/slider.tpl', $this->skin_slider) === false) {
                    throw new \Exception('Не удалось создать skin '.$module.'/slider');
                }
            }
        } else {
            if(file_put_contents($this->basedir.'/modules/'.$module.'/view/'.$module.'.tpl', $temp) === false) {
                throw new \Exception('Не удалось создать skin '.$module.'');
            }
            if(file_put_contents($this->basedir.'/modules/'.$module.'/view/add.tpl', $this->skin_add) === false) {
                throw new \Exception('Не удалось создать skin '.$module.'/add');
            }
            if(file_put_contents($this->basedir.'/modules/'.$module.'/view/edit.tpl', $this->skin_edit) === false) {
                throw new \Exception('Не удалось создать skin '.$module.'/edit');
            }
            if(file_put_contents($this->basedir.'/modules/'.$module.'/view/shop.tpl', $this->skin_shop) === false) {
                throw new \Exception('Не удалось создать skin '.$module.'/shop');
            }
            if(file_put_contents($this->basedir.'/modules/'.$module.'/view/view.tpl', $this->skin_view) === false) {
                throw new \Exception('Не удалось создать skin '.$module.'/view');
            }
            if(file_put_contents($this->basedir.'/modules/'.$module.'/view/slider.tpl', $this->skin_slider) === false) {
                throw new \Exception('Не удалось создать skin '.$module.'/slider');
            }
        }
    }
}