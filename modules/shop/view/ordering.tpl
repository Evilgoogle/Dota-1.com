<div class="main_header">
    <div class="header_left">
        <!--mobile-->
        <div class="m_left"></div>
        <div class="m_center"></div>
        <div class="m_right"></div>
    </div>
    <div class="header_center">
        <span>Добавить запись</span>
    </div>
    <div class="header_right">
        <!--mobile-->
        <div class="m_left"></div>
        <div class="m_center"></div>
        <div class="m_right"></div>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="form_top_block">
            <div class="form_top_pic"></div>
            <div class="form_block_pic">
                <div class="left"></div>
                <div class="center"></div>
                <div class="right"></div>
            </div>
        </div>
        <div class="form_center">
            <?php if(isset($error['adress'])) {?>
                <div class="alert alert-danger" role="alert"><?php echo hc($error['adress']);?></div>
            <?php } ?>
            <form action="" method="post">
                <input type="hidden" name="buy" value="'<?php echo hc($ids);?>'">
                <input type="hidden" name="sum" value="'<?php echo hc($_POST['sum']);?>'">
                <input type="hidden" name="quantity" value="<?php echo hc($quantitys);?>">
                <div class="ordering">
                    <div class="form_header_block">
                        <div class="left"></div>
                        <div class="center center_header_reg">
                            <span class="head_text">Способ получение товара</span>
                        </div>
                        <div class="right"></div>
                    </div>
                    <div class="pickup">
                        <label id="pickup_active" class="radio" onclick="ordering_show('pickup')">
                            <input type="radio" name="delivery" value="pickup">
                            Самовывоз
                        </label>
                        <div id="pickup" class="block">
                            <p><strong>После заказа вы можете самостоятельно забрать свой заказ в нашом розничном магазине</strong></p>

                            <p><strong>1</strong>. Перед посещением магазина необходимо обязательно согласовать детали заказа с менеджером Интернет-магазина</p>
                            <p><strong>2</strong>. Получить от менеджера подтверждение наличия товара.</p>
                            <p><strong>3</strong>. Получить от менеджера номер заказа, с которым необходимо подойти в кассу магазина для оплаты.</p>
                            <p><strong>4</strong>. Вы можете забрать свою покупку только в магазине, в котором есть в наличии заказанный товар.</p>
                            <br>
                            <p><u>Менеджер Интернет-магазина свяжется с Вами в течении часа с момента оформления заказа.</u></p>

                            <p>Если вы оформили заказ на сайте в нерабочее время, то операторы интернет-магазина свяжутся с Вами на следующий день.</p>
                        </div>
                    </div>
                    <div class="courier">
                        <label class="radio" onclick="ordering_show('courier')">
                            <input type="radio" name="delivery" value="courier">
                            Курьер
                        </label>
                        <div id="courier" class="block">
                            <p><strong>После выполение заказа мы пошлем вам курьера с доставкой</strong></p>

                            <p>1. Доставка осуществляется на следующий рабочий день с момента оформления заказа.</p>
                            <p>2. Наши сотрудники доставят заказ по указанному вами адресу непосредственно к Вам в квартиру или офис в течении дня с 11 до 21 и продемонстрируют целостность и комплектность товара.</p>
                            <p>3. Проверку на работоспособность и настройку товара Вы можете осуществить самостоятельно, предварительно ознакомившись с инструкцией по эксплуатации.</p>
                            <br>
                            <p><u>Менеджер Интернет-магазина свяжется с Вами в течении часа с момента оформления заказа</u></p>

                            <p>Если вы оформили заказ на сайте в нерабочее время, то операторы интернет-магазина свяжутся с Вами на следующий день.</p>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="hint">Адрес доставки</label>
                                <textarea name="adress" class="form-control form_des"><?php echo @hc($_POST['adress'],'on');?></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="form_header_block">
                        <div class="left"></div>
                        <div class="center center_header_reg">
                            <span class="head_text">Способ оплаты</span>
                        </div>
                        <div class="right"></div>
                    </div>
                    <div class="cash">
                        <label id="cash_active" class="radio" onclick="payment_show('cash')">
                            <input type="radio" name="money" value="cash">
                            Наличными
                        </label>
                        <div id="cash" class="block">
                            <p>Вы оплачиваете товар наличными курьеру интернет-магазина, при доставке или кассиру розничного магазина, при самовывозе</p>
                        </div>
                    </div>
                    <div class="cart">
                        <label class="card_web" onclick="payment_show('cart')">
                            <input type="radio" name="money" value="cart">
                            <span class="pay_text">Через карту</span>
                            <span class="img_cart"></span>
                        </label>
                        <div id="cart"></div>
                    </div>
                    <div class="web_money">
                        <label class="card_web" onclick="payment_show('web_money')">
                            <input type="radio" name="money" value="web">
                            <span class="pay_text">Через кошелек</span>
                            <span class="img_yandex"></span>
                        </label>
                        <div id="web_money"></div>
                    </div>

                    <script>
                        window.onload = function () {
                            $('#pickup_active').trigger("click");
                            $('#cash_active').trigger("click");
                            ordering_goods('<?php echo $order_json;?>', '<?php echo $sum_json;?>');
                        }
                    </script>
                </div>
                <input type="submit" name="ok" class="form_button" value="Оформить">
            </form>
        </div>
        <div class="form_bottom_block">
            <div class="form_block_pic">
                <div class="left"></div>
                <div class="center"></div>
                <div class="right"></div>
            </div>
            <div class="form_bottom_pic"></div>
        </div>
    </div>
</div>
