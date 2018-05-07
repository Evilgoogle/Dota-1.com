
        <?php if($_GET['template'] == 'table') {
            include_once('./skins/templates/add_table.tpl');
        } elseif($_GET['template'] == 'gal') {
            include_once('./skins/templates/add_gal.tpl');
        } elseif($_GET['template'] == 'carusel') {
            include_once('./skins/templates/add_carusel.tpl');
        } elseif($_GET['template'] == 'magazine') {
            include_once('./skins/templates/add_magazine.tpl');
        } 
    