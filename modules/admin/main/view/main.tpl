<?php if(!isAdmin()) {

    if(!empty(User::$data['role'])) {?>
        <script>show_info('error', 'У Вас нет прав для доступа в админку')</script>
    <?php }
    if(!empty($error['login'])) {?>
        <script>show_info('error', '<?php echo hc($error['login'])?>')</script>
    <?php }
    if(!empty($error['password'])) {?>
        <script>show_info('error', '<?php echo hc($error['password'])?>')</script>
    <?php }?>

    <form action="/<?=$_GET['route']; ?>" method="post">
        <div class="auth_reg reg_user">
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
                    <div class="form_center center_block_reg">
                        <div class="auth_hero auth_hero_users"></div>
                        <div class="auth_fon auth_fon_users"></div>
                        <div class="auth_block">
                            <div class="hero_left"></div>
                            <div class="center_block center_block_user">
                                <div class="form_header_block form_header_block_user">
                                    <div class="left"></div>
                                    <div class="center center_header_user">
                                        <span class="head_text">Авторизация</span>
                                        <input type="hidden" name="module_name" value="good">
                                    </div>
                                    <div class="right"></div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="hint">Логин</label>
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <div class="btn pseudo_left">
                                                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <!---->
                                        <input type="text" class="form-control" name="login" placeholder="Логин">
                                        <!---->
                                        <div class="input-group-btn">
                                            <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Введите свои Логин">
                                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="hint">Пароль</label>
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <div class="btn pseudo_left">
                                                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <!---->
                                        <input type="password" class="form-control" name="pass" placeholder="Пароль">
                                        <!---->
                                        <div class="input-group-btn">
                                            <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Введите пароль">
                                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="auth_button"><span>Войти</span></button>
                            </div>
                            <div class="hero_right"></div>
                        </div>
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
        </div>
    </form>

<?php } else { ?>
    <div class="main_header">
        <div class="header_left">
            <!--mobile-->
            <div class="m_left"></div>
            <div class="m_center"></div>
            <div class="m_right"></div>
        </div>
        <div class="header_center">
            <span>Добро пожаловать в Админку</span>
        </div>
        <div class="header_right">
            <!--mobile-->
            <div class="m_left"></div>
            <div class="m_center"></div>
            <div class="m_right"></div>
        </div>
    </div>
	<br>
	<p>Это админ панелька, тут можно поработать. Это админ панелька, тут можно поработать</p>

    <div class="main_header">
        <div class="header_left"></div>
        <div class="header_center">
            <span>Заказы</span>
        </div>
        <div class="header_right"></div>
    </div>
    <div class="adm_unit">
        <div class="left">
            <form class="form-inline" method="get" action="">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Dotte" name="search" value="<?php echo @hc($_GET['search'],1);?>">
                </div>
                <button type="submit" class="btn btn-default" name="ok_search">Поиск</button>
            </form>
        </div>
        <div class="right">
        </div>
    </div>
    <?php if($res->num_rows) {
        while ($set = $res->fetch_assoc()) { ?>
            <div class="good">
                <div class="good_block">
                    <div class="good_pic">
                        <div class="img"></div>
                    </div>
                    <div class="header">
                        <?php echo hc($set['name']);?>
                    </div>
                    <div class="price_block">
                        <div class="basket_price">
                            <div class="price">
                                <div class="left_t"></div>
                                <div class="center_t">
                                    <?php echo hc($set['price']);?> <span class="currency">рб</span>
                                </div>
                                <div class="right_t"></div>
                            </div>
                            <a href="" class="basket_profil"></a>
                        </div>
                    </div>
                </div>
                <div class="payment">
                    <div class="block_info">
                        <div class="text">Покупатель:</div>
                        <div class="status"><strong><?php echo hc($set['login']);?></strong></div>
                    </div>
                    <div class="block_info">
                        <div class="text">Артикул:</div>
                        <div class="status"><?php echo hc($set['id']);?></div>
                    </div>
                    <div class="block_info">
                        <div class="text">Оплата:</div>
                        <div class="status"><?php echo hc($set['payment']);?></div>
                    </div>
                    <div class="block_info">
                        <div class="text">Способ оплаты:</div>
                        <div class="status"><?php echo hc($set['admission']);?></div>
                    </div>
                    <div class="block_info">
                        <div class="text">Дата объявление заказа:</div>
                        <div class="status"><?php echo hc($set['date']);?></div>
                    </div>
                    <div class="block_info">
                        <div class="text">Способ доставки:</div>
                        <div class="status"><?php echo hc($set['dispatch']);?></div>
                    </div>
                </div>
            </div>
        <?php }
    } else {?>
        <div class="empty_good">Заказов нет</div>
    <?php }
} ?>