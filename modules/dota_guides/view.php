
        <?php
        $template = q("SELECT `template` FROM `templates` WHERE `template_id` = ".(int)$_GET['template']."");
        $set_template = $template->fetch_assoc();
        if($set_template['template'] != 'table') {
            redirect("/404");
        }

        $row = q("SELECT * FROM `data` WHERE `id` = ".(int)$_GET['id']."");
        $set = $row->fetch_assoc();
    