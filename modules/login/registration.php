<?php
if (isset($_POST['ok'], $_POST['name'], $_POST['login'], $_POST['email'], $_POST['pass'])) {

    $error = array();

    if (empty ($_POST['name'])) {
        $error['name'] = 'Вы не ввели свое имя';
    } elseif (mb_strlen($_POST['name']) < 2) {
        $error['name'] = 'Слишком короткая имя';
    } elseif (mb_strlen($_POST['name']) > 20) {
        $error['name'] = 'Слишком длинная имя';
    }

    if (empty ($_POST['login'])) {
        $error ['login'] = 'Вы не ввели Логин';
    } elseif (mb_strlen($_POST['login']) < 2) {
        $error['login'] = 'Слишком короткий логин';
    } elseif (mb_strlen($_POST['login']) > 20) {
        $error['login'] = 'Слишком длинный логин';
    } elseif (!preg_match('#^[\d\w\-\_]*$#ui',$_POST['login'])) {
        $error ['login'] = 'Логину нельзя вставить другие символы, кроме указанных';
    }

    if (empty ($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        $error ['email'] = 'Вы не заполнили поля Почта или допустили ошибку';
    }

    if (empty ($_POST['pass'])) {
        $error ['pass'] = 'Вы не ввели пароль';
    } elseif (mb_strlen($_POST['pass']) < 4) {
        $error['pass'] = 'Слишком короткий пароль. Минимум 4-х символа';
    } elseif($_POST['pass'] != $_POST['pass_ex']) {
        $error['pass'] = 'Пароли не совпадают';
    }

    if(!count($error))	{
        $res_login = q("
        	SELECT `id`
   			FROM   `fw_users`
   			WHERE  `login` = '".es($_POST['login'])."'
   			LIMIT 1
    	");
        if (mysqli_num_rows($res_login)) {
            $error ['login'] = 'Такой логин уже занят';
        }
    }

    if(!count($error))	{
        $res_email = q("
   			SELECT `id`
   			FROM   `fw_users`
   			WHERE  `email` = '".es($_POST['email'])."'
   			LIMIT 1
   		");
        if (mysqli_num_rows($res_email)) {
            $error ['email'] = 'Такой email уже занят';
        }
    }

    if(!count($error)) {
        try {
            $reg = new \MyLibs\Registration;
            $reg->datas = [
                'name' => [
                    'string' => '' . $_POST['name'] . ''
                ],
                'skype' => [
                    'string' => '' . $_POST['skype'] . ''
                ],
                'date' => [
                    'date' => ''
                ],
                'about' => [
                    'string' => '' . $_POST['about'] . ''
                ]
            ];
            $reg->regist($_POST['login'],$_POST['pass'],$_POST['email']);

            $_SESSION['info'] = 'Вам на почту отправлена ссылка для активаций';
            redirect("/");
        } catch(Exception $e) {
            $error ['login'] = $e;
        }
    }
}