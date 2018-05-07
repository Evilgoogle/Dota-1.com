
        <?php if($_GET['template'] == 'one') {
	        include_once('./skins/templates/edit_one.tpl');
        } elseif($_GET['template'] == 'table') {
            include_once('./skins/templates/edit_table.tpl');
        } elseif($_GET['template'] == 'carusel') {
            include_once('./skins/templates/edit_carusel.tpl');
        } elseif($_GET['template'] == 'magazine') {
            include_once('./skins/templates/edit_magazine.tpl');
        } 
    