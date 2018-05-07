<?php
namespace MyLibs;

/**
 * Class MyDate
 * Этим классом можно получить дату завтрашнего понятной человеку формате,а также в компьютерном формате
 *
 * @package MyLibs
 * @author Evil_Google <evilgoogle@mail.ru>
 * @version 1.0.0
 */

class MyDate
{
    /**
     * @var string $new_date - Здесь будет хранится дата завтрашного дня в компьютерном формате
     */
    public $new_date;

    /**
     * @var array $arr - Это архив с названиями месяцев. Он нужен для получение даты понятной для человека
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
     * getNextDay
     * Это метод отдает дату понятной человеку формате
     *
     * @return string
     */
    public function getNextDay() {
        $date = (new \DateTime())->modify('+1 day');
        $this->new_date = $date->format('Y-m-d');
        preg_match('#^([0-9]*)\-([0-9]*)\-([0-9]*)$#', $this->new_date, $matches);
        foreach ($this->arr as $k=>$v) {
            if($k == $matches[2]) {
                $mount = $v;
            }
        }
        return $matches[3].' '.$mount.' '.$matches[1].' года';
    }

    /**
     * getDate
     * Этот метод отдает дату в компьютерном формате
     *
     * @return string
     */
    public function getDate () {
        return $this->new_date;
    }
}