<?php
function my_session_start() {
	if (ini_get('session.use_cookies') && isset($_COOKIE['PHPSESSID'])) {
		$sessid = $_COOKIE['PHPSESSID'];
	} elseif (!ini_get('session.use_only_cookies') && isset($_GET['PHPSESSID'])) {
		$sessid = $_GET['PHPSESSID'];
	} else {
		session_start();
		return true;
	}

	if (!preg_match('/^[-,a-zA-Z0-9]{1,128}$/', $sessid)) {
		return false;
	}
	session_start();

   return true;
}
if (!my_session_start()) {
    session_id(uniqid());
    session_start();
    session_regenerate_id();
}

class User extends \MyLibs\User {
	static $name = '';
    static $email = '';
    static $date = '';
    static $skype = '';
    static $ip = '';
    static $about = '';
    static $img = '';
	static $datas = ['id','role','login','name', 'email', 'date', 'skype', 'ip', 'about', 'img'];
}

User::start(isset($_SESSION['user']['id']) ? ['id' => (int)$_SESSION['user']['id']] : []);

//Авторизация на главной странице
if(isset($_POST['auth'], $_POST['login'],$_POST['pass'])) {
    $auth = new \FW\User\Authorization;
    if($auth->authByLoginPass($_POST['login'],$_POST['pass'],isset($_POST['remember']) ? true : false)) {
        if(isset($_COOKIE['buy'])) {
            q("UPDATE `orders` SET `user_id` = " . (int)$_SESSION['user']['id'] . " WHERE `user_id` = '" . es($_COOKIE['buy']) . "'");
            setcookie('buy', $_SESSION['user']['id'], time() + 3600 * 10, '/');
        }
    } else {
        $error = $auth->getErrorMess();
        $_SESSION['wrong-form']['time'] = time();
        $_SESSION['wrong-form']['key'] = (isset($_SESSION['wrong-form']['key']) ? ($_SESSION['wrong-form']['key']+1) : 1);
    }
}
//

if(isset($_SESSION['user']['id'])) {
    $_SESSION['user'] = User::$data;
}

//Количество товаров в корзине
if(isset($_COOKIE['buy'])) {
    $res_count = q("SELECT `id` FROM `orders` WHERE `user_id` = '".es($_COOKIE['buy'])."'");
    $count_goods = $res_count->num_rows;
} else {
    $count_goods = 0;
}

if(!isset($_SESSION['antixsrf'])) {
	$_SESSION['antixsrf'] = md5(time().$_SERVER['REMOTE_ADDR'].(isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : rand(1,99999)));
}
