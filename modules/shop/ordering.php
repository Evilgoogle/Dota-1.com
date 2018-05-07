<?php
if(isset($_POST['order'], $_POST['sum'])) {
    $order_json = json_encode($_POST['order']);
    $sum_json = json_encode($_POST['sum']);

    foreach ($_POST['order'] as $value) {
       $id[] = $value['artikul'];
       $quantity[$value['artikul']] = $value['quantity'];
    }
    $ids = implode(',', $id);
    $quantitys = json_encode($quantity);

} elseif(isset($_POST['ok'], $_POST['buy'])) {

    $error = array();
    $buy = preg_replace('#\'#iu', '', $_POST['buy']);
    $sum = preg_replace('#\'#iu', '', $_POST['sum']);
    $quantity = json_decode($_POST['quantity'], true);

    if($_POST['delivery'] == 'courier') {
        if(empty($_POST['adress'])) {
            $error['adress'] = 'Введите адрес. Это нужна чтоб курьер смог вам доставить товар';
        }
    }

    if (!count($error)) {
        if($_POST['money'] == 'cash') {
            $money = 'Наличными';
        } elseif ($_POST['money'] == 'cart') {
            $money = 'Перевод';
        } elseif ($_POST['money'] == 'web') {
            $money = 'Перевод';
        }
        if($_POST['delivery'] == 'pickup') {
            $delivery = 'Самовывоз';
        } elseif ($_POST['delivery'] == 'courier') {
            $delivery = 'Курьер';
        }
        $res = q("SELECT `name`, `price`, `id`  FROM `data` WHERE `id` IN (".$buy.")");
        while ($set = $res->fetch_assoc()) {
            foreach ($quantity as $key=>$val) {
                if($key == $set['id']) {
                    for($i = 1; $i <= $val; ++$i) {
                        q("INSERT INTO `buy` SET
                            `artikul`    = " . (int)$set['id'] . ",
                            `user_id`    = " . (int)$_SESSION['user']['id'] . ",
                            `name`       = '" . es($set['name']) . "',
                            `price`      = " . (int)$set['price'] . ",
                            `date`       = NOW(),
                            `payment`    = 'Еще не оплачена',
                            `admission`  = '" . es($money) . "',
                            `dispatch`   = '" . es($delivery) . "'
		                ");

                        $id[] = \DB::_()->insert_id;
                    }
                }
            }
            q("DELETE FROM `orders` WHERE `data_id` = ".(int)$set['id']."");
        }

        if(!isset($_POST['transfer'])) {
            redirect('/shop/success');
        } elseif($_POST['transfer'] == 'cart') {
            $_SESSION['pay'] = [
                'cart' => [
                    'id' => $id, 'sum' => $sum, 'user' => $_SESSION['user']['id']
                ]
            ];
            redirect('/shop/pay');
        } elseif($_POST['transfer'] == 'web') {
            $_SESSION['pay'] = [
                'web' => [
                    'id' => $id, 'sum' => $sum, 'user' => $_SESSION['user']['id']
                ]
            ];
            redirect('/shop/pay');
        }
    }

} else {
    redirect('/shop');
}