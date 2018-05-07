<?php
$order = [];
if(isset($_COOKIE['buy'])) {

    //Удаление дубликатов
    //Дубликаты могут появится в том случае, если пользователь не авторизировашись добавлял в корзину товары. А потом сделал авторизицаю. В этом случае на странице авторизаций ранее добавленные товары под ключем ip адреса пользователя, перейдут авторизированному у которого есть этот ip адрес.
    $duplicate = q("SELECT COUNT(`data_id`) AS `num`, `data_id` FROM `orders` WHERE `user_id` = '".es($_COOKIE['buy'])."' GROUP BY `data_id` HAVING `num` > 1");
    if($duplicate->num_rows) {
        while ($set_duplicate = $duplicate->fetch_assoc()) {
            $num = $set_duplicate['num']-1;
            q("DELETE FROM `orders` WHERE `data_id` = ".(int)$set_duplicate['data_id']." LIMIT ".$num."");
        }
    }

    //Запрос
    $res = q("SELECT DISTINCT `orders`.`id`, `orders`.`data_id`, `orders`.`user_id`, `data`.`id` as `artikul`, `data`.`name`, `data`.`des`, `data`.`price`, `data`.`module_id`, `data`.`template_id` 
        FROM `orders`
        JOIN `data` ON `orders`.`data_id` = `data`.`id`
        WHERE `user_id` = '".es($_COOKIE['buy'])."'
    ");

    if($res->num_rows) {
        while ($set = $res->fetch_assoc()) {
            $order[] = $set;
            //Модуль
            $module = q("SELECT `name` FROM `modules` WHERE `id` = '".(int)$set['module_id']."' LIMIT 1");
            $set_module[$set['module_id']] = $module->fetch_assoc();
            //Картины товара
            $gal = q("SELECT * FROM `gallery` WHERE `data_id` = '".(int)$set['data_id']."'");
            while($set_gal_get = $gal->fetch_assoc()) {
                $set_gal[$set['id']][] = $set_gal_get;
            }
            //Свойства товара
            $prop = q("SELECT * FROM `data_properties` WHERE `data_id` = '".(int)$set['data_id']."'");
            if($prop->num_rows) {
                while($set_prop_get = $prop->fetch_assoc()) {
                    $set_prop[$set['id']][] = $set_prop_get;
                }
            } else {
                $set_prop = [];
            }
        }
    }
}