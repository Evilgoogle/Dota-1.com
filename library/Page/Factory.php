<?php
namespace Page;

/**
 * Class Factory
 * Этот класс испольняет роль хранилище и в нем будет хранится свойтсва полученнего от обработки у класса loader
 *
 * @package Page
 * @author Evil_Google <evilgoogle@mail.ru>
 * @version 1.0.0
 * @copyright Evil_Google 2017
 */

class Factory
{
    /**
     * @var $loader - здесь будет хранится класс loader
     */
	private $loader;
    /**
     * @var $id - здесь будет хранится id модуля
     */
	public $id;
    /**
     * @var $model_result - здесь будет хранится все экземпляры классов подгружанных в loader
     */
	public $model_result;

    /**
     * Factory constructor.
     * @param class $class
     * @return null
     */
	public function __construct($class) {
	    $this->loader = $class;
	}

    /**
     * model
     * Здесь вызывается метод model класса loader нужное для подгрзуки модуля
     *
     * @param int $module_id
     * @param int $template_id
     * @param string $template
     * @return null
     */
	public function model($module_id, $template_id, $template) {
		$this->loader->model($module_id, $template_id, $template);
	}

    /**
     * view
     * Здесь вызывается метод view класса loader нужное для подгрзуки шаблона
     */
	public function view() {
			$this->loader->view();
	}
}