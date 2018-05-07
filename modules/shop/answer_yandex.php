<?php
if(isset($_POST['notification_type'], $_POST['operation_id'], $_POST['amount'], $_POST['currency'], $_POST['datetime'], $_POST['sender'], $_POST['codepro'], $_POST['label'])) {
    $notification_secret = "vGTcudXPkuMo793ruVUq6H1i";

    $notification_type = $_POST['notification_type'];
    $operation_id = $_POST['operation_id'];
    $amount = $_POST['amount'];
    $currency = $_POST['currency'];
    $datetime = $_POST['datetime'];
    $sender = $_POST['sender'];
    $codepro = $_POST['codepro'];
    $label = $_POST['label'];

    $sha1_hash = $_POST['sha1_hash'];

    $hash = $notification_type . '&' . $operation_id . '&' . $amount . '&' . $currency . '&' . $datetime . '&' . $sender . '&' . $codepro . '&' . $notification_secret . '&' . $label;

    $sha1 = hash("sha1", $hash);

    if ($sha1 == $sha1_hash) {
        $ok = 'Succes: Ответ пришел правильный. Идентификатор операций: ' . $operation_id . "\r\n" . '--date: ' . date("Y-m-d H:i:s") . "\r\n" . "===================================";
        file_put_contents('./logs/money.log', $ok . "\r\n\r\n", FILE_APPEND);

        //registration_pay
        q("INSERT INTO `registration_pay` SET 
          `notification_type` = '" . es($notification_type) . "', 
          `operation_id`      = '" . (int)$operation_id . "', 
          `sender`            = '" . $_POST['sender'] . "',
          `datetime`          = '" . $datetime . "',
          `amount`            = '" . es($amount) . "',
          `label`             = '" . es($label) . "'
        ");

        //Shoping
        if(!empty($label)) {
            if (!isset($_POST['unaccepted']) && $_POST['codepro'] === false) {

                ////////////////// TEST
                $ok = ''. $label .', Отправитель '.$_POST['sender']. "\r\n" . '--date: ' . date("Y-m-d H:i:s") . "\r\n" . "===================================";
                file_put_contents('./logs/money.log', $ok . "\r\n\r\n", FILE_APPEND);
                /// //////////// TEST

            } else {
                $ok = 'ERROR BUY: Произошла ошибка при покупке - надо проверить не имеется ли защита codepro или существует ли unaccepted. Идентификатор операций: ' . $operation_id .', Отправитель '.$_POST['sender']. "\r\n" . '--date: ' . date("Y-m-d H:i:s") . "\r\n" . "===================================";
                file_put_contents('./logs/money.log', $ok . "\r\n\r\n", FILE_APPEND);

                /*$mail = new \MyLibs\MailDota(true);
                $mail->Subject = 'Не удалось оплатить ' . \Core::$DOMAIN;
                $mail->addAddress($email, $email);
                $mail->msgHTML('<div>Не удалось оплатить заказ. Попробуйте оплатить другим способом</div>');
                $mail->send();
                unset($mail);*/
            }
        }
    } else {
        $ok = 'ERROR: Произошла ошибка. Не верный ответ' . "\r\n" . '--date: ' . date("Y-m-d H:i:s") . "\r\n" . "===================================";
        file_put_contents('./logs/money.log', $ok . "\r\n\r\n", FILE_APPEND);
    }
}