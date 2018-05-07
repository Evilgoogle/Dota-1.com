
        <?php
        if(isset($_GET['template'])) {
            if ($_GET['template'] == 'one') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET['template_id'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template['template'] != 'one') {
                    redirect("/404");
                } else {
                    include_once('./modules/mods/edit_one.php');
                }
            } elseif ($_GET['template'] == 'table') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET['template_id'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template['template'] != 'table') {
                    redirect("/404");
                } else {
                    include_once('./modules/mods/edit_table.php');
                }
            } elseif ($_GET['template'] == 'carusel') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET['template_id'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template['template'] != 'carusel') {
                    redirect("/404");
                } else {
                    include_once('./modules/mods/edit_carusel.php');
                }
            } elseif ($_GET['template'] == 'magazine') {
                $template = q("SELECT `template` FROM `templates` WHERE `template_id` = " . (int)$_GET['template_id'] . "");
                $set_template = $template->fetch_assoc();
                if ($set_template['template'] != 'magazine') {
                    redirect("/404");
                } else {
                    include_once('./modules/mods/edit_magazine.php');
                }
            }
        } else {
            redirect("/404");
        }
    