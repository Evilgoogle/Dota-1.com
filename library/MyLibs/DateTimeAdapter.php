<?php
namespace MyLibs;

/**
 * Class DateTimeAdapter
 * Этим классом можно получить дату в компьютерном формате отправив ему дату в понятной человеку формате
 *
 * @package MyLibs
 * @author Evil_Google <evilgoogle@mail.ru>
 * @version 1.0.0
 */

class DateTimeAdapter
{

    /**
     * @var array $arr - Это архив с названиями месяцев. Он нужен для конвертаций даты в компьютерный формат
     */
    public $arr = [
        '01' => 'Январь',
        '02' => 'Фебраль',
        '03' => 'Март',
        '04' => 'Апрель',
        '05' => 'Маи',
        '06' => 'Июнь',
        '07' => 'Июль',
        '08' => 'Агуст',
        '09' => 'Сентябрь',
        '10' => 'Октябрь',
        '11' => 'Ноябрь',
        '12' => 'Декабрь'
    ];

    /**
     * format
     * Этот метод получает дату понятной человеку формате(17 Декабрь 2017 года) и конвертирует его на компьютерный
     *
     * @param string $dateы
     * @return string
     */
    public function format($date) {
        preg_match('#^([0-9]*)\s([а-я]*)\s([0-9]*)#iu', $date, $matches);
        foreach ($this->arr as $k=>$v) {
            if($v == $matches[2]) {
                $mount = $k;
            }
        }
        $date = $matches[3].'-'.$mount.'-'.$matches[1];
        return (new \DateTime)->format($date);
    }

}