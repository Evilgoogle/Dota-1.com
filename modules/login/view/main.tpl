<?php if(!isset($_SESSION['user']['id'])) {

    if(!empty($error['login'])) {?>
        <script>show_info('error', '<?php echo hc($error['login'])?>')</script>
    <?php }
    if(!empty($error['password'])) {?>
        <script>show_info('error', '<?php echo hc($error['password'])?>')</script>
    <?php }
    if(!empty($error[0])) {?>
        <script>show_info('error', '<?php echo hc($error[0])?>')</script>
    <?php }?>

    <form action="" method="post">
        <?php if(isset($_GET['goods'])) {?>
            <input type="hidden" name="goods" value="">
        <?php }?>
        <div class="auth_reg">
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
                        <div class="auth_hero"></div>
                        <div class="auth_fon"></div>
                        <div class="auth_block">
                            <div class="hero_left"></div>
                            <div class="center_block">
                                <div class="form_header_block">
                                    <div class="left"></div>
                                    <div class="center">
                                        <span class="head_text">Авторизация</span>
                                        <input type="hidden" name="module_name" value="good">
                                    </div>
                                    <div class="right"></div>
                                    <!--mobile-->
                                    <div class="modile_top">
                                        <div class="m_left"></div>
                                        <div class="m_center"></div>
                                        <div class="m_right"></div>
                                    </div>
                                    <div class="mobile_center">
                                        <span>Авторизация</span>
                                    </div>
                                    <div class="mobile_bottom">
                                        <div class="m_left"></div>
                                        <div class="m_center"></div>
                                        <div class="m_right"></div>
                                    </div>
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
                                        <input type="text" class="form-control" name="login" placeholder="Логин" value="<?php echo @hc($_POST['login'],'on');?>">
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
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="remember"> Запомнить?
                                    </label>
                                </div>
                                <button type="submit" class="auth_button" name="ok"><span>Войти</span></button>
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
	<div class="user_profil">
        <div class="top_pic"></div>
        <div class="top">
            <div class="left"></div>
            <div class="center"></div>
            <div class="right"></div>
        </div>
        <div class="block">
            <div class="block_left"></div>
            <div class="block_center">
                <div class="use_top">
                    <div class="use_left">
                        <div class="border">
                            <div class="avatar">
                                <?php if(!empty($_SESSION['user']['img'])) {?>
                                    <img src="<?php echo hc($_SESSION['user']['img']);?>" alt="<?php echo hc($_SESSION['user']['login']);?>">
                                <?php } else {?>
                                    <img src="/skins/img/none_avatar.png" alt="avatar">
                                <?php }?>
                            </div>
                            <div class="users_id">
                                <div class="pic"></div>
                            </div>
                        </div>
                    </div>
                    <div class="use_right">
                        <div class="name_block">
                            <div class="name_left"></div>
                            <div class="name_center">
                                <span class="head_text"><?php echo hc($_SESSION['user']['login'])?></span>
                            </div>
                            <div class="name_right"></div>
                        </div>
                        <div class="communication">
                            <div class="mail">
                                <div class="icon"></div>
                                <div class="text"><span><?php echo hc($_SESSION['user']['email'])?></span></div>
                            </div>
                            <div class="skype">
                                <div class="icon"></div>
                                <div class="text"><span><?php echo hc($_SESSION['user']['skype'])?></span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="use_bottom">
                    <div class="prof_fon"></div>
                    <div class="user_info">
                        <div class="info_i">Имя</div>
                        <div class="text_inf"><?php echo hc($_SESSION['user']['name'])?></div>
                    </div>
                    <div class="user_info">
                        <div class="info_i">Статус</div>
                        <strong class="text_inf">
                            <?php if($_SESSION['user']['role'] == 'admin') {
                                echo 'Администратор';
                            } elseif($_SESSION['user']['role'] == 'supermoderator') {
                                echo 'Супермодератор';
                            } elseif($_SESSION['user']['role'] == 'moderator') {
                                echo 'Модератор';
                            } elseif($_SESSION['user']['role'] == 'user') {
                                echo 'Пользователь';
                            }?>
                        </strong>
                    </div>
                    <div class="user_info">
                        <div class="info_i">Дата Регистраций</div>
                        <div class="text_inf"><?php echo hc($_SESSION['user']['date'])?></div>
                    </div>
                    <div class="user_info">
                        <div class="info_i">Ip</div>
                        <div class="text_inf"><?php echo hc($_SESSION['user']['ip'])?></div>
                    </div>
                </div>
            </div>
            <div class="block_right"></div>
        </div>
        <div class="bottom">
            <div class="left"></div>
            <div class="center"></div>
            <div class="right"></div>
        </div>
    </div>

    <div class="user_profil">
        <div class="top_pic"></div>
        <div class="top">
            <div class="left"></div>
            <div class="center"></div>
            <div class="right"></div>
        </div>
        <div class="block">
            <div class="block_left"></div>
            <div class="block_center block_center_bottom">
                <div class="form_header_block">
                    <div class="left"></div>
                    <div class="center">
                        <span class="head_text">Мои записий</span>
                    </div>
                    <div class="right"></div>
                </div>
                <div class="profil_records">
                    <?php if($res->num_rows) {
                        while($set = $res->fetch_assoc()) {
                            if($set['template'] == 'one') {?>
                                <a href="/<?php echo hc($set['module_name'])?>" class="record">
                                    <span>Одиночный шаблон</span>
                                    <?php echo hc($set['header']);?>
                                </a>
                            <?php } elseif($set['template'] == 'table') {?>
                                <a href="/<?php echo hc($set['module_name'])?>/view&id=<?php echo hc($set['id'])?>&template=<?php echo hc($set['template_id'])?>" class="record">
                                    <span>Табличный шаблон</span>
                                    <?php echo hc($set['name']);?>
                                </a>
                            <?php } elseif($set['template'] == 'gal') {?>
                                <a href="/<?php echo hc($set['module_name'])?>" class="record">
                                    <span>Галерейный шаблон</span>
                                    <?php echo hc($set['name']);?>
                                </a>
                            <?php } elseif($set['template'] == 'carusel') {?>
                                <a href="/<?php echo hc($set['module_name'])?>/slider&id=<?php echo hc($set['id'])?>&template=<?php echo hc($set['template_id'])?>" class="record">
                                    <span>Карусельный шаблон</span>
                                    <?php echo hc($set['name']);?>
                                </a>
                            <?php } elseif($set['template'] == 'magazine') {?>
                                <a href="/<?php echo hc($set['module_name'])?>/shop&id=<?php echo hc($set['id'])?>&template=<?php echo hc($set['template_id'])?>" class="record">
                                    <span>Магазинный шаблон</span>
                                    <?php echo hc($set['name']);?>
                                </a>
                            <?php }
                        }
                    } else {?>
                        <div class="record">Нечего не добавлена</div>
                    <?php }?>
                </div>

                <div class="form_header_block">
                    <div class="left"></div>
                    <div class="center">
                        <span class="head_text">Мои заказы</span>
                    </div>
                    <div class="right"></div>
                </div>
                <div class="profil_records">
                    <?php if($good->num_rows) {
                        while($set_good = $good->fetch_assoc()) {?>
                            <div class="good">
                                <div class="good_block">
                                    <div class="header_block">
                                        <div class="good_pic">
                                            <div class="img"></div>
                                        </div>
                                        <div class="header">
                                            <?php echo hc($set_good['name']);?>
                                        </div>
                                    </div>
                                    <div class="price_block">
                                        <div class="basket_price">
                                            <div class="price">
                                                <div class="left_t"></div>
                                                <div class="center_t">
                                                    <?php echo hc($set_good['price']);?> <span class="currency">рб</span>
                                                </div>
                                                <div class="right_t"></div>
                                            </div>
                                            <a href="/login/pay?id=<?php echo hc($set_good['id']);?>&admission=<?php echo hc($set_good['admission'])?>" class="basket_profil" data-toggle="tooltip" data-placement="left" title="" data-original-title="Оплатить"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="payment">
                                    <span class="pay_text">
                                        <strong>Артикул:</strong> <?php echo hc($set_good['artikul']);?>
                                    </span>
                                    <p class="status">
                                        <?php if($set_good['admission'] == 'Наличными') {
                                            echo 'Заплатите курьеру или продавцу в магазине';
                                        } elseif ($set_good['admission'] == 'Перевод') {
                                            if($set_good['payment'] == 'Еще не оплачена') {
                                                echo 'Еще не оплачена';
                                            } elseif ($set_good['payment'] == 'Оплачена') {
                                                echo 'Оплачена';
                                            }
                                        }?>
                                    </p>
                                </div>
                            </div>
                        <?php }
                    } else {?>
                        <div class="record">Покупок нет</div>
                    <?php }?>
                </div>

                <div class="form_header_block">
                    <div class="left"></div>
                    <div class="center">
                        <span class="head_text">Обо мне</span>
                    </div>
                    <div class="right"></div>
                </div>
                <div class="profil_records">
                    <div class="profil_text"><?php echo $_SESSION['user']['about']?></div>
                </div>
            </div>
            <div class="block_right"></div>
        </div>
        <div class="bottom">
            <div class="left"></div>
            <div class="center"></div>
            <div class="right"></div>
        </div>
    </div>
<?php } ?>

<script>
    window.onload = function () {
        $('#init_panel').empty();
    }
</script>
