<?php
if (isset($_POST['ok'], $_POST['name'], $_POST['email'], $_POST['pass'], $_POST['skype'], $_POST['about'])) {

    $_POST['name'] = trimALL($_POST['name']);
    $_POST['email'] = trimALL($_POST['email']);
    $_POST['skype'] = trimALL($_POST['skype']);
    $_POST['about'] = trimALL($_POST['about']);

    $error = array();

    if (empty ($_POST['name'])) {
        $error['name'] = 'Вы не ввели свое имя';
    } elseif (mb_strlen($_POST['name']) < 2) {
        $error['name'] = 'Слишком короткая имя';
    } elseif (mb_strlen($_POST['name']) > 20) {
        $error['name'] = 'Слишком длинная имя';
    }

    if (empty ($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        $error ['email'] = 'Вы не заполнили поля Почта или допустили ошибку';
    }

    if(!empty($_POST['pass'])) {
        if (mb_strlen($_POST['pass']) < 4) {
            $error['pass'] = 'Слишком короткий пароль. Минимум 4-х символа';
        } elseif ($_POST['pass'] != $_POST['pass_ex']) {
            $error['pass'] = 'Пароли не совпадают';
        }
    }

    if(!count($error))	{
        $res_email = q("
   			SELECT `id`
   			FROM   `fw_users`
   			WHERE  `email` = '".es($_POST['email'])."'
   			AND    `email` <> '".es($_SESSION['user']['email'])."'
   			LIMIT 1
   		");
        if (mysqli_num_rows($res_email)) {
            $error ['email'] = 'Такой email уже занят';
        }
    }

    if (!count($error)) {

        $test_mini = 'ok';
        $test_preview = 'ok';
        if (isset($_POST['img'])) {
            foreach ($_POST['img'] as $img_key_upl => $img_val_upl) {
                if (array_key_exists('preview', $_POST['img'])) {
                    if ($img_key_upl == 'preview') {
                        $upload_preview = new \MyLibs\Uploader();
                        $upload_preview->minwidth = 101;
                        $upload_preview->minheight = 120;
                        $upload_preview->save_origin = false;
                        $name_preview = date('Ymd-his') . 'avatar' . rand(100000, 999999) . '.jpg';
                        try {
                            $file_preview = $upload_preview->cropUpload($img_key_upl, $img_val_upl, $name_preview);
                            $upload_preview->hasResize();
                            $test_preview = 'ok';
                        } catch (Exception $e) {
                            $error['preview'] = 'Превью картина - ' . $e;
                            $test_preview = 'error';
                        }
                    }
                }
            }
        }

        $mini_pic_uploaded = 'error';
        $preview_pic_uploaded = 'error';
        if ($test_mini == 'ok') {
            if ($test_preview == 'ok') {
                if (isset($_POST['img'])) {
                    foreach ($_POST['img'] as $img_key => $img_val) {
                        if (array_key_exists('preview', $_POST['img'])) {
                            $del_preview = q("SELECT `img` FROM `fw_users` WHERE `id` = " . (int)$_SESSION['user']['id'] . "");
                            $set_preview_del = $del_preview->fetch_assoc();
                            @unlink('.' . $set_preview_del['img']);
                            if ($img_key == 'preview') {
                                $upload_preview->load();
                                $upload_preview->resize(101, 120, 'mini');
                                $preview_pic_uploaded = 'ok';
                            }
                        }
                    }
                }
            }
        }
    }

    if(!count($error)) {
        $uploded_preview = ($preview_pic_uploaded == 'ok') ? $upload_preview->refilename : $_POST['preview_preview'];

        q("UPDATE `fw_users` SET
          `name`     = '".es($_POST['name'])."',
          `email`    = '".es($_POST['email'])."',
          `img`      = '".es($uploded_preview)."',
          `skype`    = '".es($_POST['skype'])."',
          `about`    = '".es($_POST['about'])."'
          WHERE `id` = ".(int)$_SESSION['user']['id']."
        ");
        if(!empty($_POST['pass'])) {
            q("UPDATE `fw_users` SET
				`password`   = '".password_hash($_POST['pass'],PASSWORD_DEFAULT)."'
				WHERE `id`   ='".es($_SESSION['user']['id'])."'
			");
        }
        $_SESSION['info'] = 'Изминений успешно применены';
        redirect('/');
    }
}

if(isset($_SESSION['user'])) {
    $res = q("SELECT * FROM `fw_users` WHERE `id` = ".(int)$_SESSION['user']['id']."");
    $set = $res->fetch_assoc();
} else {
    redirect('/');
}