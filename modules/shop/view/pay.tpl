<?php
if(isset($_SESSION['pay']) && key($_SESSION['pay']) == 'cart') {
    foreach ($_SESSION['pay'] as $arr) {
        foreach ($arr as $key=>$value) {
            if($key == 'sum') {
                $sum = $value;
            }
            if($key == 'user') {
                $user = $value;
            }
            if($key == 'id') {
                foreach ($value as $item) {
                    $ids[] = $item;
                }
            }
        }
    }
    $id = implode('+',$ids);
    unset($_SESSION['pay']);

    $label = $id.'-'.$sum.'-'.$user; ?>
    <div class="pay_block">
        <div class="form_header_block">
            <div class="left"></div>
            <div class="center">
                <span class="head_text">Оплатить - <?php echo $sum ?> рб</span>
            </div>
            <div class="right"></div>
            <!--mobile-->
            <div class="modile_top">
                <div class="m_left"></div>
                <div class="m_center"></div>
                <div class="m_right"></div>
            </div>
            <div class="mobile_center">
                <span>Оплатить - <?php echo $sum ?> рб</span>
            </div>
            <div class="mobile_bottom">
                <div class="m_left"></div>
                <div class="m_center"></div>
                <div class="m_right"></div>
            </div>
        </div>
        <div class="bottom">
            <div class="left">
                <iframe src="https://money.yandex.ru/quickpay/button-widget?targets=%D0%9E%D0%BF%D0%BB%D0%B0%D1%82%D0%B0%20%D1%82%D0%BE%D0%B2%D0%B0%D1%80%D0%B0&default-sum=<?php echo $sum;?>&button-text=11&any-card-payment-type=on&button-size=m&button-color=black&<?php echo $label ?>&successURL=http%3A%2F%2Fevil-google.school-php.com%2Fshop%2Fsuccess%3Fyandex&quickpay=small&account=410015006609593&" width="184" height="36" frameborder="0" allowtransparency="true" scrolling="no"></iframe>
            </div>
            <div class="rigth">
                Дальнейшая оплата будет происходит на стороне сайта Яндекс. Вы можете оплату сделать сейчас нажав на эту кнопку или сделать его позже зайдя в личный кабинет
            </div>
        </div>
    </div>

<?php } elseif(isset($_SESSION['pay']) && key($_SESSION['pay']) == 'web') {
    foreach ($_SESSION['pay'] as $arr) {
        foreach ($arr as $key=>$value) {
            if($key == 'sum') {
                $sum = $value;
            }
            if($key == 'user') {
                $user = $value;
            }
            if($key == 'id') {
                foreach ($value as $item) {
                    $ids[] = $item;
                }
            }
        }
    }
    $id = implode('+',$ids);
    unset($_SESSION['pay']);

    $label = $id.'-'.$sum.'-'.$user;?>
    <div class="pay_block">
        <div class="form_header_block">
            <div class="left"></div>
            <div class="center">
                <span class="head_text">Оплатить - <?php echo $sum ?> рб</span>
            </div>
            <div class="right"></div>
            <!--mobile-->
            <div class="modile_top">
                <div class="m_left"></div>
                <div class="m_center"></div>
                <div class="m_right"></div>
            </div>
            <div class="mobile_center">
                <span>Оплатить - <?php echo $sum ?> рб</span>
            </div>
            <div class="mobile_bottom">
                <div class="m_left"></div>
                <div class="m_center"></div>
                <div class="m_right"></div>
            </div>
        </div>
        <div class="bottom">
            <div class="left">
                <iframe src="https://money.yandex.ru/quickpay/button-widget?targets=%D0%9E%D0%BF%D0%BB%D0%B0%D1%82%D0%B0%20%D1%82%D0%BE%D0%B2%D0%B0%D1%80%D0%B0&default-sum=<?php echo $sum;?>&button-text=11&yamoney-payment-type=on&button-size=m&button-color=black&label=<?php echo $label ?>&successURL=http%3A%2F%2Fevil-google.school-php.com%2Fshop%2Fsuccess%3Fyandex&quickpay=small&account=410015006609593&" width="184" height="36" frameborder="0" allowtransparency="true" scrolling="no"></iframe>
            </div>
            <div class="rigth">
                Дальнейшая оплата будет происходит на стороне сайта Яндекс. Вы можете оплату сделать сейчас нажав на эту кнопку или сделать его позже зайдя в личный кабинет
            </div>
        </div>
    </div>
<?php } else {
    redirect('/');
}