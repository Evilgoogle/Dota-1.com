<div class="main_header">
    <div class="header_left">
        <!--mobile-->
        <div class="m_left"></div>
        <div class="m_center"></div>
        <div class="m_right"></div>
    </div>
    <div class="header_center">
        <span><?php echo hc($set['name'])?></span>
    </div>
    <div class="header_right">
        <!--mobile-->
        <div class="m_left"></div>
        <div class="m_center"></div>
        <div class="m_right"></div>
    </div>
</div>
<?php if($_GET['admission'] == 'Перевод') {?>
<div class="pay_block">
    <div class="form_header_block">
        <div class="left"></div>
        <div class="center">
            <span class="head_text">Оплатить - <?php echo hc($set['price'])?> рб</span>
        </div>
        <div class="right"></div>
        <!--mobile-->
        <div class="modile_top">
            <div class="m_left"></div>
            <div class="m_center"></div>
            <div class="m_right"></div>
        </div>
        <div class="mobile_center">
            <span>Оплатить - <?php echo hc($set['price'])?> рб</span>
        </div>
        <div class="mobile_bottom">
            <div class="m_left"></div>
            <div class="m_center"></div>
            <div class="m_right"></div>
        </div>
    </div>
    <div class="bottom">
        <div class="left">
            <button type="button" onclick="switch_pay(<?php echo hc($set['id'])?>,'cash');" class="form_button">Сделать</button>
        </div>
        <div class="rigth">
            <strong>Оплатить наличными.</strong><br> Сделать оплату наличными курьеру при доставке или продавцу в магазине при самовывозе. Нажмите на эту кнопку и ваша оплата будет зарегистрирована как - <u>Клиент оплачивает наличными</u>. Тогда мы будем ждать от вас оплаты наличными.
        </div>
    </div>
</div>
<?php } elseif($_GET['admission'] == 'Наличными') {?>
    <div class="pay_block">
        <div class="form_header_block">
            <div class="left"></div>
            <div class="center">
                <span class="head_text">Оплатить - <?php echo hc($set['price'])?> рб</span>
            </div>
            <div class="right"></div>
            <!--mobile-->
            <div class="modile_top">
                <div class="m_left"></div>
                <div class="m_center"></div>
                <div class="m_right"></div>
            </div>
            <div class="mobile_center">
                <span>Оплатить - <?php echo hc($set['price'])?> рб</span>
            </div>
            <div class="mobile_bottom">
                <div class="m_left"></div>
                <div class="m_center"></div>
                <div class="m_right"></div>
            </div>
        </div>
        <div class="bottom">
            <div class="left">
                <button type="button" onclick="switch_pay(<?php echo hc($set['id'])?>,'transfer');" class="form_button">Сделать</button>
            </div>
            <div class="rigth">
                <strong>Оплатить через перевод.</strong><br> Оповестите нас если вы хотите сделать оплату через кошелек или банковскую карту. Нажмите на эту кнопку и ваша оплата будет зарегистрирована как - <u>Клиент оплачивает переводом</u>. Тогда мы будем ждать от вас оплаты переводом.
            </div>
        </div>
    </div>
<?php }?>
<div class="pay_block">
    <div class="form_header_block">
        <div class="left"></div>
        <div class="center">
            <span class="head_text">Оплатить - <?php echo hc($set['price'])?> рб</span>
        </div>
        <div class="right"></div>
        <!--mobile-->
        <div class="modile_top">
            <div class="m_left"></div>
            <div class="m_center"></div>
            <div class="m_right"></div>
        </div>
        <div class="mobile_center">
            <span>Оплатить - <?php echo hc($set['price'])?> рб</span>
        </div>
        <div class="mobile_bottom">
            <div class="m_left"></div>
            <div class="m_center"></div>
            <div class="m_right"></div>
        </div>
    </div>
    <div class="bottom">
        <div class="left">
            <iframe src="https://money.yandex.ru/quickpay/button-widget?targets=%D0%9E%D0%BF%D0%BB%D0%B0%D1%82%D0%B0%20%D1%82%D0%BE%D0%B2%D0%B0%D1%80%D0%B0&default-sum=<?php echo $set['price']?>&button-text=11&yamoney-payment-type=on&button-size=m&button-color=black&label=<?php echo $label ?>&successURL=http%3A%2F%2Fevil-google.school-php.com%2Fshop%2Fsuccess%3Fyandex&quickpay=small&account=410015006609593&" width="184" height="36" frameborder="0" allowtransparency="true" scrolling="no"></iframe>
        </div>
        <div class="rigth">
            <strong>Оплатить через яндекс кошелек.</strong><br> После нажатие на кнопку произойдет переадрисация на страницу яндекса и там будет происходит дальнейшая оплата. После оплаты вы можете легко забрать свой товар или заказать курьера.
        </div>
    </div>
</div>

<div class="pay_block">
    <div class="form_header_block">
        <div class="left"></div>
        <div class="center">
            <span class="head_text">Оплатить - <?php echo hc($set['price'])?> рб</span>
        </div>
        <div class="right"></div>
        <!--mobile-->
        <div class="modile_top">
            <div class="m_left"></div>
            <div class="m_center"></div>
            <div class="m_right"></div>
        </div>
        <div class="mobile_center">
            <span>Оплатить - <?php echo hc($set['price'])?> рб</span>
        </div>
        <div class="mobile_bottom">
            <div class="m_left"></div>
            <div class="m_center"></div>
            <div class="m_right"></div>
        </div>
    </div>
    <div class="bottom">
        <div class="left">
            <iframe src="https://money.yandex.ru/quickpay/button-widget?targets=%D0%9E%D0%BF%D0%BB%D0%B0%D1%82%D0%B0%20%D1%82%D0%BE%D0%B2%D0%B0%D1%80%D0%B0&default-sum=<?php echo $set['price']?>&button-text=11&any-card-payment-type=on&button-size=m&button-color=black&<?php echo $label ?>&successURL=http%3A%2F%2Fevil-google.school-php.com%2Fshop%2Fsuccess%3Fyandex&quickpay=small&account=410015006609593&" width="184" height="36" frameborder="0" allowtransparency="true" scrolling="no"></iframe>
        </div>
        <div class="rigth">
            <strong>Оплатить через банковскую карту.</strong><br> Можно оплачивать через карты visa, mastercard и maestro. После нажатие на кнопку произойдет переадрисация на страницу яндекса и там будет происходит дальнейшая оплата. После оплаты вы можете легко забрать свой товар или заказать курьера.
        </div>
    </div>
</div>