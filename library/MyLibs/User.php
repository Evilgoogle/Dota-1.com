<?php
namespace MyLibs;

/**
 * Class User
 * Когда пользователь авторизируется или ходить авторизированным по сайту,
 * то этот класс проверяет этого пользователя - блокирует его если он в списке заблокированных ip адресов, выкидывает если он забанен,
 * записывает в базу каждый его шаг если он админ и находится в админке сайта.
 * Также этот класс выводит капту если пользователь не авторизирован
 *
 * Этот класс наследует класс \FW\User\User
 * @package MyLibs
 *
 */

class User extends \FW\User\User
{
    static $my_datas = ['role','login','access'];
    static $result = NULL;
    static $captha = 0;
    static $users_info = [];

    /**
     * Функция - Start
     * Этот метод обрабатыает зашедших на сайт пользователей. Если забанен выкидывает, блокирует. Следит за ним если он админ.
     *
     * @param array $auth
     * @return class
     */

    static function Start($auth = []) {
        $cal_class = get_called_class();
        if(count($auth)) {
            // Блокировка определенных ip адресов
            $ip = q("SELECT `ip`".(count($cal_class::$my_datas) ? ',`'.implode('`,`',$cal_class::$my_datas).'`' : '')." FROM `fw_users` WHERE `id` = ".(int)$auth['id']."");
            $set_ip = $ip->fetch_assoc();
            self::$result['access'] = $set_ip['access']; // Сохраняю для дальнейшего использование чтоб не дергать базу по несколько раз
            self::$result['role'] = $set_ip['role']; // Сохраняю для дальнейшего использование чтоб не дергать базу по несколько раз
            self::$result['login'] = $set_ip['login']; // Сохраняю для дальнейшего использование чтоб не дергать базу по несколько раз
            $banned = q("SELECT `ip` FROM `banned_ip` WHERE `ip` = '".es($set_ip['ip'])."'");
            if($banned->num_rows) {
                header("HTTP/1.0 503 Service Unavailable");
                require './skins/stubroutine.tpl';
                exit;
            }
            // Вылет забаненных пользователей
            if(isset(self::$result['access']) && self::$result['access'] == 2) {
                \FW\User\Authorization::logout();
                $_SESSION['error'] = 'Ваш акаунт был заблокирован Администратором сайта';
                redirect('/');
            }

            // Captcha
            if(empty($auth)) {
                self::$captha = 1;
            } else {
                self::$captha = 0;
            }
        }

        return parent::Start($auth);
    }

}