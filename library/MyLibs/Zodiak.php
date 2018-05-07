<?php
namespace MyLibs;

/**
 * Class zodiak
 * Этот класс возвращяет знак зодиака по переданной дате
 *
 * @package MyLibs
 * @author Evil_Google <evilgoogle@mail.ru>
 * @version 1.0.0
 */
class zodiak
{
    /**
     * @var string $mathes - это свойства примет месяц и день
     */
    public $mathes;

    /**
     * go
     * Принимает дату (пример 18-05-2018) и возвращяает знак зодиака
     *
     * @param $date
     * @return string
     */
    public function go($date) {
        $date = preg_match('#^([0-3][0-9])\-([0-1][0-9])\-[0-9][0-9][0-9][0-9]$#',$date, $mathes);
        $this->mathes = $mathes;

        if($date) {
            if($mathes[2] == '00') {
                $this->mathes = $mathes[2];
                return 'Такого месяца нет - ' . $mathes[2] . '';
            } elseif($mathes[2] > 12) {
                $this->mathes = $mathes[2];
                return 'Такого месяца нет - ' . $mathes[2] . '';
            } elseif($mathes[2] == '01') {
                if($mathes[1] == '00') {
                    $this->mathes = $mathes[1];
                    return 'День введен не правильно - ' . $mathes[1] . '';
                } elseif($mathes[1] > 31) {
                    $this->mathes = $mathes[2];
                    return 'День не может привышать 31 у этого месяца - ' . $mathes[2] . '';
                } elseif($mathes[1] < 19 ) {
                    return 'Стрелец';
                } else {
                    return 'Козерог';
                }
            } elseif($mathes[2] == '02') {
                if($mathes[1] == '00') {
                    $this->mathes = $mathes[1];
                    return 'День введен не правильно - ' . $mathes[1] . '';
                } elseif($mathes[1] > 28) {
                    $this->mathes = $mathes[2];
                    return 'День не может привышать 28 у этого месяца - ' . $mathes[2] . '';
                } elseif($mathes[1] < 16 ) {
                    return 'Козерог';
                } else {
                    return 'Водолей';
                }
            } elseif($mathes[2] == '03') {
                if($mathes[1] == '00') {
                    $this->mathes = $mathes[1];
                    return 'День введен не правильно - ' . $mathes[1] . '';
                } elseif($mathes[1] > 31) {
                    $this->mathes = $mathes[2];
                    return 'День не может привышать 31 у этого месяца - ' . $mathes[2] . '';
                } elseif($mathes[1] < 12 ) {
                    return 'Водолей';
                } else {
                    return 'Рыбы';
                }
            } elseif($mathes[2] == '04') {
                if($mathes[1] == '00') {
                    $this->mathes = $mathes[1];
                    return 'День введен не правильно - ' . $mathes[1] . '';
                } elseif($mathes[1] > 30) {
                    $this->mathes = $mathes[2];
                    return 'День не может привышать 30 у этого месяца - ' . $mathes[2] . '';
                } elseif($mathes[1] < 18 ) {
                    return 'Рыбы';
                } else {
                    return 'Овен';
                }
            } elseif($mathes[2] == '05') {
                if($mathes[1] == '00') {
                    $this->mathes = $mathes[1];
                    return 'День введен не правильно - ' . $mathes[1] . '';
                } elseif($mathes[1] > 31) {
                    $this->mathes = $mathes[2];
                    return 'День не может привышать 31 у этого месяца - ' . $mathes[2] . '';
                } elseif($mathes[1] < 14 ) {
                    return 'Овен';
                } else {
                    return 'Телец';
                }
            } elseif($mathes[2] == '06') {
                if($mathes[1] == '00') {
                    $this->mathes = $mathes[1];
                    return 'День введен не правильно - ' . $mathes[1] . '';
                } elseif($mathes[1] > 30) {
                    $this->mathes = $mathes[2];
                    return 'День не может привышать 30 у этого месяца - ' . $mathes[2] . '';
                } elseif($mathes[1] < 21 ) {
                    return 'Телец';
                } else {
                    return 'Близнецы';
                }
            } elseif($mathes[2] == '07') {
                if($mathes[1] == '00') {
                    $this->mathes = $mathes[1];
                    return 'День введен не правильно - ' . $mathes[1] . '';
                } elseif($mathes[1] > 31) {
                    $this->mathes = $mathes[2];
                    return 'День не может привышать 31 у этого месяца - ' . $mathes[2] . '';
                } elseif($mathes[1] < 20 ) {
                    return 'Близнецы';
                } else {
                    return 'Рак';
                }
            } elseif($mathes[2] == '08') {
                if($mathes[1] == '00') {
                    $this->mathes = $mathes[1];
                    return 'День введен не правильно - ' . $mathes[1] . '';
                } elseif($mathes[1] > 31) {
                    $this->mathes = $mathes[2];
                    return 'День не может привышать 31 у этого месяца - ' . $mathes[2] . '';
                } elseif($mathes[1] < 11 ) {
                    return 'Рак';
                } else {
                    return 'Лев';
                }
            } elseif($mathes[2] == '09') {
                if($mathes[1] == '00') {
                    $this->mathes = $mathes[1];
                    return 'День введен не правильно - ' . $mathes[1] . '';
                } elseif($mathes[1] > 30) {
                    $this->mathes = $mathes[2];
                    return 'День не может привышать 30 у этого месяца - ' . $mathes[2] . '';
                } elseif($mathes[1] < 17 ) {
                    return 'Лев';
                } else {
                    return 'Дева';
                }
            } elseif($mathes[2] == '10') {
                if($mathes[1] == '00') {
                    $this->mathes = $mathes[1];
                    return 'День введен не правильно - ' . $mathes[1] . '';
                } elseif($mathes[1] > 31) {
                    $this->mathes = $mathes[2];
                    return 'День не может привышать 31 у этого месяца - ' . $mathes[2] . '';
                } elseif($mathes[1] < 31 ) {
                    return 'Дева';
                } else {
                    return 'Весы';
                }
            } elseif($mathes[2] == '11') {
                if($mathes[1] == '00') {
                    $this->mathes = $mathes[1];
                    return 'День введен не правильно - ' . $mathes[1] . '';
                } elseif($mathes[1] > 30) {
                    $this->mathes = $mathes[2];
                    return 'День не может привышать 30 у этого месяца - ' . $mathes[2] . '';
                } elseif($mathes[1] < 22 ) {
                    return 'Весы';
                } elseif($mathes[1] < 30 && $mathes[1] > 22) {
                    return 'Скорпион';
                }
            } elseif($mathes[2] == '12') {
                if($mathes[1] == '00') {
                    $this->mathes = $mathes[1];
                    return 'День введен не правильно - ' . $mathes[1] . '';
                } elseif($mathes[1] > 31) {
                    $this->mathes = $mathes[2];
                    return 'День не может привышать 31 у этого месяца - ' . $mathes[2] . '';
                } elseif($mathes[1] < 18 ) {
                    return 'Змееносец';
                } elseif($mathes[1] < 30) {
                    return 'Стрелец';
                }
            }
        } else {
            return 'Вы не правильно ввели дату';
        }
    }
}