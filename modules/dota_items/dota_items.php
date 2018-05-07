
            <?php
                if(isset($_POST['del'])) {
                    if(isset($_SESSION['user'])) {
                        if ($_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {
                            if (isset($_POST['ids'])) {
                                $_POST['ids'] = intALL($_POST['ids'], 1);
                                $ids = implode(',', $_POST['ids']);

                                if (key($_POST['del']) == 'table') {
                                    q("DELETE FROM `data` WHERE `id` IN (" . $ids . ")");
                                    $_SESSION['info'] = 'Удаление прошла успешно';
                                    foreach ($_POST['del'] as $val) {
                                        header('Location: /' . key($val) . '');
                                    }
                                    exit();
                                } elseif (key($_POST['del']) == 'gal') {
                                    $dell = q("SELECT `img` FROM `data` WHERE `id` IN (" . $ids . ")");
                                    while ($set_dell = $dell->fetch_assoc()) {
                                        @unlink('.' . $set_dell['img']);
                                    }
                                    $dell_pr = q("SELECT `preview` FROM `data` WHERE `id` IN (" . $ids . ")");
                                    while ($set_dell_pr = $dell_pr->fetch_assoc()) {
                                        @unlink('.' . $set_dell_pr['preview']);
                                    }

                                    q("DELETE FROM `data` WHERE `id` IN (" . $ids . ")");
                                    $_SESSION['info'] = 'Удаление прошла успешно';
                                    foreach ($_POST['del'] as $val) {
                                        header('Location: /' . key($val) . '');
                                    }
                                    exit();
                                } elseif (key($_POST['del']) == 'carusel') {
                                } elseif (key($_POST['del']) == 'magazine') {
                                }
                            } else {
                                $_SESSION['def'] = 'Отметьте то что хотите удалить';
                            }
                        } else {
                            $_SESSION['def'] = 'У вас нет прав на удаление';
                        }
                    } else {
                        $_SESSION['def'] = 'У вас нет прав на удаление';
                    }
                }
                
                $template = q("SELECT `modules`.`id`, `modules`.`seo_url`, `templates`.`template_id`, `templates`.`template`
                FROM `modules`
                LEFT JOIN `templates` ON `templates`.`module_id` = `modules`.`id`
                WHERE `seo_url` = '".es($_GET['_page'])."'");
                
                $loader = new \Page\Loader();
                $factory = new \Page\Factory($loader);
                $loader->factory = $factory;
                
                while($set_model = $template->fetch_assoc()) {
                    $factory->model($set_model['id'], $set_model['template_id'], $set_model['template']);
                    $factory->module = $set_model['seo_url'];
                }
        