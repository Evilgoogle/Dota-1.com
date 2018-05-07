<?php
namespace Page;

/**
 * Class Loader
 * Этот класс занимается подгрузкой модуля и вида
 *
 * @package Page
 * @author Evil_Google <evilgoogle@mail.ru>
 * @version 1.0.0
 * @copyright Evil_Google 2017
 */

class Loader
{
    /**
     * @var class $factory - это переменная нужна для хранение класса factory
     */
	public $factory;

    /**
     * model
     * Этот метод подгружает модель из директорий ./modules/mods/ и создает экземпляр класса подгружаемого $template
     * Подгружаемые классы с данными идут на свойства $model_result класса factory.
     *
     * @param int $module_id
     * @param int $template_id
     * @param string $template
     * @return null
     */
	public function model($module_id, $template_id, $template) {
		$file  = './modules/mods/'.$template.'.php';
			
		include_once($file);
		$this->factory->model_result[$template][$template_id] = new $template($module_id, $template_id);
		$this->factory->id = $module_id;
	}

    /**
     * view
     * Этот метод подгружает шаблон из директорий ./skins/templates/. Здесь идет обработка всех данных из свойства $model_result класса Factory
     * Далее все это используется в подгруженном шаблоне
     *
     * @return null
     */
	public function view() {
		foreach ($this->factory->model_result as $template=>$value) {
            if($template == 'table') {
                foreach ($value as $template_id=>$class) {
                    $dota_cat[$template_id] = $class->dota_cat;
                }
            }
            if($template == 'magazine') {
                foreach ($value as $template_id=>$class) {
                    $gallery[$template_id] =$class->gallery;
                }
            }
            if($template == 'table' || $template == 'gal') {
                foreach ($value as $template_id=>$class) {
                    $cat[$template_id] = $class->cat;
                }
            }
			foreach ($value as $template_id=>$class) {
				$rows[$this->factory->module][$this->factory->id][$template_id] = $class->data;
                $container[$template_id] = $class->container;
			}
			include('./skins/templates/'.$template.'.tpl');
			unset($rows);
		}
	}
}