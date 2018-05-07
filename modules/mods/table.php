<?php
class table
{
	public $data;
    public $container;
    public $cat;
    public $dota_cat;

	public function __construct($module_id, $template_id) {
        $data = q("SELECT * FROM `data` WHERE `module_id` = ".(int)$module_id." AND `template_id` = ".(int)$template_id."");
        while($set_data = $data->fetch_assoc()) {
            $this->data[] = $set_data;
        }

        $cat = q("SELECT `id`,`cat` FROM `cat` WHERE `module_id` = ".(int)$module_id." AND `template_id` = ".(int)$template_id."");
        while ($set_cat = $cat->fetch_assoc()) {
            $this->cat[] = $set_cat;
        }

        $container = q("SELECT `view`,`container`,`itemscope`,`tegh`,`header` FROM `templates` WHERE `module_id` = ".(int)$module_id." AND `template_id` = ".(int)$template_id."");
        $this->container = $container->fetch_assoc();

        $dota_cat = q("
          SELECT `data`.*, `cat`.`id` as `cat_id`,`cat`.`cat` as `cat_name` 
          FROM `data` 
          JOIN `cat` ON `data`.`cat` = `cat`.`id`
          WHERE `data`.`module_id` = ".(int)$module_id." AND `data`.`template_id` = ".(int)$template_id."
        ");
        while ($set_dota_cat = $dota_cat->fetch_assoc()) {
            $this->dota_cat[] = $set_dota_cat;
        }
    }
}