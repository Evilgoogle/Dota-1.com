<?php
class one
{
	public $data;

	public function __construct($module_id, $template_id) {
        $data = q("SELECT * FROM `data` WHERE `module_id` = ".(int)$module_id." AND `template_id` = ".(int)$template_id."");
        $this->data = $data->fetch_assoc();
        $container = q("SELECT `view`,`container`,`itemscope`,`tegh`,`header` FROM `templates` WHERE `module_id` = ".(int)$module_id." AND `template_id` = ".(int)$template_id."");
        $this->container = $container->fetch_assoc();
	}
}