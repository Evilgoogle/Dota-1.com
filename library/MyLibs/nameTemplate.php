<?php
namespace MyLibs;

class nameTemplate
{
    static function renaming($name) {
        if($name == 'one') {
            return 'Одиночный шаблон-';
        } elseif($name == 'table') {
            return 'Табличный шаблон-';
        } else if($name == 'gal') {
            return 'Галерейный шаблон-';
        } elseif($name == 'carusel') {
            return 'Карусельный шаблон-';
        } elseif($name == 'magazine') {
            return 'Магазинный шаблон-';
        }
    }
}