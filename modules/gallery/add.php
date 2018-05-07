
        <?php
        if(isset($_GET['template'])) {
            if ($_GET['template'] == 'table') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET['template_id'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template['template'] != 'table') {
                    redirect("/404");
                } else {
                    include_once('./modules/mods/add_table.php');
                }
            } elseif ($_GET['template'] == 'gal') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET['template_id'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template['template'] != 'gal') {
                    redirect("/404");
                } else {
                    include_once('./modules/mods/add_gal.php');
                }
            } elseif ($_GET['template'] == 'carusel') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET['template_id'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template['template'] != 'carusel') {
                    redirect("/404");
                    exit();
                } else {
                    include_once('./modules/mods/add_carusel.php');
                }
            } elseif ($_GET['template'] == 'magazine') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET['template_id'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template['template'] != 'magazine') {
                    redirect("/404");
                } else {
                    include_once('./modules/mods/add_magazine.php');
                }
            }
        } else {
            redirect("/404");
        }
    