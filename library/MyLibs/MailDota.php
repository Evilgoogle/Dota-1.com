<?php
namespace MyLibs;

class MailDota extends \PHPMailer\PHPMailer\PHPMailer
{
    public function __construct($exceptions = null) {
        $this->CharSet = 'UTF-8';
        $this->setFrom(\Core::$NOREPLY, \Core::$SITENAME);
        $this->addReplyTo(\Core::$NOREPLY, \Core::$SITENAME);
        parent::__construct($exceptions);
    }

    /*
     * Этим классом указазывается куда письмо отравляется. Он был доработан и теперь умеет проверять кто у нас отписался от рассылки
     */
    public function addAddress($address, $name = '') {
        $res = q("
			SELECT 1
			FROM `fw_unsubscribe`
			WHERE `email` = '".es($address)."'
		");
        if($res->num_rows) {
            if($this->exceptions) {
                throw new phpmailerException('E-mail blocked');
            }
            $this->ErrorInfo = 'E-mail blocked';
            return false;
        }
        return parent::addAddress($address, $name);
    }

    public function msgHTML($message, $basedir = '', $advanced = false) {
        if(empty($this->to[0][0])) {
            if($this->exceptions) {
                throw new phpmailerException('E-mail not insert');
            }
            $this->ErrorInfo = 'E-mail not insert';
            return false;
        }

        $key = time();
        $hash = \myHash($this->to[0][0].preg_replace('#^.{2}(.+).{2}$#u',"\\1",$key));
        $unsubscribe = \Core::$DOMAIN.'/login/unsubscribe?email='.urlencode($this->to[0][0]).'&amp;key='.urlencode($key).'&amp;hash='.urlencode($hash);
        $this->addCustomHeader("List-Unsubscribe",'<mailto:'.\Core::$ADMIN.'>, <'.$unsubscribe.'>');
        $message = '
        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html lang="ru" style="background-color: #000000;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Дота 1</title>
</head>
<body style="margin: 0px;">
<div style="background-color: #000000; line-height: 1.5;">
<div class="maincontent" style="max-width: 600px;background-color: #211f1f;margin: auto;padding-top: 20px;font-family: \'Montserrat\', sans-serif">
<div role="banner" class="banner" style="max-height: 360px;">
<img style="max-width: 600px; width: 100%; max-height: 366px;background-color: #131313" src="'.\Core::$DOMAIN.'/skins/img/dota_mail_bunner.jpg">
</div>
<div style="width: 100%; height: 16px; background-image: url('.\Core::$DOMAIN.'/skins/img/bottom_repeat.jpg)"></div>
        '.$message.'
        <div style="width: 100%; height: 21px; background-image: url('.\Core::$DOMAIN.'/skins/img/footer_repeat_top.png)"></div>
<div role="footer" style="background-color: #1a1a1a;">
<div style="padding: 25px; text-align: center; font-size: 14px; line-height: 22.2px; letter-spacing: 0.32px">
<p style="color:#6e6e6e; text-align: center"><span style="color:#cccccc">Dota-1.com</span> - является ресурсом посвященный игре dota или же dota allstars являющиеся модификацией Warcraft III. В нашем портале вы найдете гайды по героям и предметам доты, а также последние новости игрового мира доты.</p>
<p style="color:#cccccc; text-align: center">Не забудьте добавить нашу почту список ваших контактов!!</p>
<div style="margin-top: 40px; text-align: center">
                    <a href="'.\Core::$DOMAIN.'" style="display: inline-block"><img src="'.\Core::$DOMAIN.'/skins/img/logo.png" alt="'.\Core::$SITENAME.'"></a>
                    <div class="down" style="color: #6e6e6e;display: inline-block;vertical-align: top; margin: 40px auto">&copy; 2018 Все права защищены!</div>
                    <div style="clear: both"></div>
                </div>
</div>
</div>
</div>
</div>
</body>
</html>
        ';
        return parent::msgHTML($message, $basedir, $advanced);
    }
}