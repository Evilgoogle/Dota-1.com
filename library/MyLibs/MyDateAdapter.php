<?php
namespace MyLibs;

/**
 * Class MyDateAdapter
 * Этот класс отдает нынешную дату и дату завтрашнего дня в компьютерном формате
 *
 * @package MyLibs
 * @author Evil_Google <evilgoogle@mail.ru>
 * @version 1.0.0
 */

class MyDateAdapter
{
    /**
     * @var string $date_on - нужен для хранение нынешнего времени
     */
    public $date_on;
    /**
     * @var string $return_date - нужен для хранение времени полученного от метода класса \MyLibs\MyDate()
     */
    public $return_date;

    /**
     * MyDateAdapter constructor.
     * Этот метод получает дату завтрашнего дня
     *
     * @return null
     */
    public function __construct() {
        $this->date_on = date('Y-m-d'); // Нынешная время
        $date = new \MyLibs\MyDate();
        $date->getNextDay();
        $this->return_date = $date->getDate();
    }
}