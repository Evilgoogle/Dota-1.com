<?php
class magazine
{
    public $data;
    public $view;
    public $gallery;

    public function __construct($module_id, $template_id) {
        $data = q("SELECT * FROM `data` WHERE `module_id` = ".(int)$module_id." AND `template_id` = ".(int)$template_id."");
        while($set_data = $data->fetch_assoc()) {
            $this->data[] = $set_data;
        }

        $container = q("SELECT `view`,`container`,`itemscope`,`tegh`,`header` FROM `templates` WHERE `module_id` = ".(int)$module_id." AND `template_id` = ".(int)$template_id."");
        $this->container = $container->fetch_assoc();

        $gallery = q("SELECT `id`,`data_id`, `mini`, `preview`, `img` FROM `gallery`");
        while($set_gallery = $gallery->fetch_assoc()) {
            $this->gallery[] = $set_gallery;
        }
    }
}