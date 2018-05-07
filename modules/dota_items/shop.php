
        <?php
        $template = q("SELECT `template` FROM `templates` WHERE `template_id` = ".(int)$_GET['template']."");
        $set_template = $template->fetch_assoc();
        if($set_template['template'] != 'magazine') {
            redirect("/404");
        }
        
        $row = q("SELECT * FROM `data` WHERE `id` =  '".(int)$_GET['id']."'");
        $set = $row->fetch_assoc();
        
        $get_gal = q("SELECT * FROM `gallery` WHERE `data_id` = ".(int)$_GET['id']."");
        while($set_gal = $get_gal->fetch_assoc()) {
            $gal[] = $set_gal;
        }
    