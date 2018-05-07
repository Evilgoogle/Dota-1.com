<?php
namespace MyLibs;

class Registration extends \FW\User\Registration
{
    public $datas = [];

    function regist($login,$password,$email) {
        $pass = password_hash($password,PASSWORD_DEFAULT);
        $data = [];
        foreach ($this->datas as $key=>$arr) {
            foreach ($arr as $sort=>$val) {
                if($sort == 'int') {
                    $data[] = "`".$key."` = ".(int)$val."";
                } elseif($sort == 'string') {
                    $data[] = "`".$key."` = '".es($val)."'";
                } elseif($sort == 'date') {
                    $data[] = "`".$key."` = NOW()";
                } elseif($sort == 'hash') {
                    $data[] = "`".$key."` = '".MyHash($val)."'";
                }
            }
        }
        if(!empty($data))  {
            q("
                INSERT INTO `fw_users` SET
                `login` = '".es($login)."',
                `password` = '".es($pass)."',
                `email` = '".es($email)."',
                ".implode(',', $data)."
		    ");
        } else {
            q("
                INSERT INTO `fw_users` SET
                `login` = '".es($login)."',
                `password` = '".es($pass)."',
                `email` = '".es($email)."'
		    ");
        }
        $id = \DB::_()->insert_id;
        $hash = md5($id.microtime(true).rand(1,1000000).$pass);
        q("
			UPDATE `fw_users` SET
			`hash` = '".es($hash)."'
			WHERE `id` = ".$id."
		");
        return $this->sendActivate_dota($id,$hash,$email);
    }

    function sendActivate_dota($id,$hash,$email) {
        try {
            $mail = new MailDota(true);
            $mail->Subject = 'Регистрация на сайте '.\Core::$DOMAIN;
            $mail->addAddress($email, $email);
            $mail->msgHTML('
            <div role="main" style="padding: 35px; text-align: center; font-size: 14px; line-height: 22.2px; letter-spacing: 0.32px">
            <div style="font-size: 30px;color: #a09da0; line-height: 50px;font-weight: bold">Регистрация в Dota-1.com</div>
            <p style="color: #a09da0; margin-top: 20px">Здравстуйте! К нам от вас пришел запрос на регистарцию в ресурсе Dota-1.com. При регистрация вы становитесь полноценным пользователем нашего портала и вам откроется возможность коментирование. Если этот запрос отправили вы, то нажмите на ниже стоящую кнопку активаций, если же нет то проигнорируйте это сообщение.</p>
            <a href="'.\Core::$DOMAIN.'/login/activate/'.$id.'/'.$hash.'" class="button" style="width: 219px;height: 52px;padding-top: 25px;font-size: 15px;font-weight:bold;display: inline-block;color: #878787;text-decoration: none;text-align: center; background-image: url('.\Core::$DOMAIN.'/skins/img/table_button_mail.png)">Активировать</a>
            </div>
            ');
            $mail->send();
            unset($mail);
        } catch (Exception $e) {
            trigger_error('Ошибка регистрации: '. print_r($e,1));
        }
        return true;
    }
}