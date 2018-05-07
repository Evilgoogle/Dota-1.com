<?php
namespace MyLibs;

class HasModule
{
    static function id($id) {
        $row = q("SELECT `id` FROM `modules` WHERE `id` = '".(int)$id."'");
        if($row->num_rows) {
            throw new \Exception('Модуль с таким id существует - '.$id.'');
        }
    }
    static function name($name) {
        if(preg_match('#admin#iu', $name)) {
            throw new \Exception('Нельзя создавать модуль с таким названием - '.$name.'');
        } elseif(preg_match('#mods#iu', $name)) {
            throw new \Exception('Нельзя создавать модуль с таким названием - '.$name.'');
        } elseif(preg_match('#ajax#iu', $name)) {
            throw new \Exception('Нельзя создавать модуль с таким названием - '.$name.'');
        } elseif(preg_match('#static#iu', $name)) {
            throw new \Exception('Нельзя создавать модуль с таким названием - '.$name.'');
        } else {
            $row = q("SELECT `id` FROM `modules` WHERE `name` = '".es($name)."'");
            if($row->num_rows) {
                throw new \Exception('Модуль с таким именем существует - '.$name.'');
            }
        }
    }
    static function seoUrl($url) {
        if(preg_match('#admin#iu', $url)) {
            throw new \Exception('SEO Url с таким названием не допустим- '.$url.'.');
        } elseif(preg_match('#mods#iu', $url)) {
            throw new \Exception('SEO Url с таким названием не допустим- '.$url.'.');
        } elseif(preg_match('#ajax#iu', $url)) {
            throw new \Exception('SEO Url с таким названием не допустим - '.$url.'');
        } elseif(preg_match('#static#iu', $url)) {
            throw new \Exception('SEO Url с таким названием не допустим - '.$url.'');
        } elseif(preg_match('#add#iu', $url)) {
            throw new \Exception('Нельзя создавать модуль с таким названием - '.$url.'');
        } elseif(preg_match('#edit#iu', $url)) {
            throw new \Exception('Нельзя создавать модуль с таким названием - '.$url.'');
        } elseif(preg_match('#view#iu', $url)) {
            throw new \Exception('Нельзя создавать модуль с таким названием - '.$url.'');
        } elseif(preg_match('#shop#iu', $url)) {
            throw new \Exception('Нельзя создавать модуль с таким названием - '.$url.'');
        } elseif(preg_match('#slider#iu', $url)) {
            throw new \Exception('Нельзя создавать модуль с таким названием - '.$url.'');
        } elseif(preg_match('#login#iu', $url)) {
            throw new \Exception('Нельзя создавать модуль с таким названием - '.$url.'');
        } elseif(preg_match('#main#iu', $url)) {
            throw new \Exception('Нельзя создавать модуль с таким названием - '.$url.'');
        } else {
            $row = q("SELECT `id` FROM `modules` WHERE `seo_url` = '".es($url)."'");
            if($row->num_rows) {
                throw new \Exception('Модуль с таким seo_url существует - '.$url.'');
            }
        }
    }
    static function folder($folder) {
        if(file_exists('./modules/'.$folder.'')) {
            throw new \Exception('Папка с таким названием уже существует - '.$folder.'');
        }
    }
}