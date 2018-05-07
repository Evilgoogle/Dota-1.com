<?php
class gal
{
	public $data;
    public $cat;

	public function __construct($module_id, $template_id) {
        $this->data = q("SELECT * FROM `data` WHERE `module_id` = ".(int)$module_id." AND `template_id` = ".(int)$template_id."");
        $container = q("SELECT `view`,`container`,`itemscope`,`tegh`,`header` FROM `templates` WHERE `module_id` = ".(int)$module_id." AND `template_id` = ".(int)$template_id."");
        $this->container = $container->fetch_assoc();

        $cat = q("SELECT `id`,`cat` FROM `cat` WHERE `module_id` = ".(int)$module_id." AND `template_id` = ".(int)$template_id."");
        while ($set_cat = $cat->fetch_assoc()) {
            $this->cat[] = $set_cat;
        }
	}
}