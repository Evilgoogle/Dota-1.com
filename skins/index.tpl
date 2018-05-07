<!DOCTYPE html>
<html lang="<?php echo Core::$LANGUAGE['lang']; ?>">
<head>
<meta charset="UTF-8">
<?php foreach(Core::$META['dns-prefetch'] as $v) { ?>
<link rel="dns-prefetch" href="<?php echo $v; ?>">
<?php } ?>
<title><?php echo hc(Core::$META['title']); ?></title>
<meta name="apple-mobile-web-app-title" content="<?php echo hc(Core::$META['title']); ?>">
<meta name="description" content="<?php echo hc(Core::$META['description']); ?>">
<meta name="keywords" content="<?php echo hc(Core::$META['keywords']); ?>">
<meta name="author" content="Усков Станислав">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<meta name="robots" content="index, follow">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<?php if(Core::$LANGUAGE['status']) {foreach(Core::$LANGUAGE['allow'] as $v) { if($v != Core::$LANGUAGE['lang']) { ?>
<link rel="alternate" hreflang="<?php echo $v; ?>" href="<?php echo createUrl('this',false,$v); ?>">
<?php } } } ?>
<?php if(!empty(Core::$META['prev'])) { ?>
<link rel="prev" href="<?php echo Core::$META['prev']; ?>">
<?php } ?>
<?php if(!empty(Core::$META['next'])) { ?>
<link rel="next" href="<?php echo Core::$META['next']; ?>">
<?php } ?>
<?php if(!empty(Core::$META['canonical'])) { ?>
<link rel="canonical" href="<?php echo Core::$META['canonical']; ?>">
<?php } ?>
<?php if(!empty(Core::$META['shortlink'])) { ?>
<link rel="shortlink" href="<?php echo Core::$META['shortlink']; ?>">
<?php } ?>
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="/touch-icon-iphone.png">
<link rel="apple-touch-icon" sizes="76x76" href="/touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="120x120" href="/touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="152x152" href="/touch-icon-ipad-retina.png">
<?php echo Core::$META['head']; ?>
<link href="/skins/components/bower/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/skins/components/bower/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="/skins<?=Core::$SKIN;?>/css/styles.min.css" rel="stylesheet">
<script src="/skins/components/bower/jquery/dist/jquery.min.js"></script>
<script src="/skins/components/custom/ckeditor/ckeditor.js"></script>
<script src="/skins<?php echo Core::$SKIN;?>/js/scripts.min.js"></script>
</head>
<body>
<!--Info-->
<div id="disp" class="disp">
    <div>
        <div id="disp_info" class="info"></div>
        <div id="disp_close" class="close_x" onClick="cls();"></div>
    </div>
</div>
<?php if(isset($_SESSION['info'])) {?>
    <script>
        show_info('ok','<?php echo hc($_SESSION['info']);?>');
    </script>
    <?php unset($_SESSION['info']);
} elseif(isset($_SESSION['def'])) {?>
    <script>
        show_info('error','<?php echo hc($_SESSION['def'])?>');
    </script>
    <?php unset($_SESSION['def']);
}?>
<!---->

<!--Magazine_view-->
<div class="modal fade" id="modal_magazine" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal_fon"></div>
            <div class="modal-header_mod">
                <button class="modal_button_close" data-dismiss="modal" aria-label="Close">Закрыть</button>
            </div>
            <div class="modal-body_magazine modal_dota"></div>
        </div>
    </div>
</div>
<!---->
<!-- Modal Delete-->
<div class="modal fade bs-example-modal-s" id="delete" tabindex="-1" role="dialog" aria-labelledby="modal_header_del">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div id="modal_header_del" class="modal-title">Внимание!</div>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                <button id="delete_button" type="button" class="btn btn-primary">Удалить</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal Img -->
<div class="modal fade bs-example-modal-lg" id="crop" tabindex="-1" role="dialog" aria-labelledby="modal_header_img">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div id="modal_header_img" class="modal-title"></div>
            </div>
            <div id="crop_img" class="modal-body"></div>
            <div class="modal-footer">
                <input type='file' id="upload">
                <button id="insert_img" data-dismiss="modal" type="button" class="btn btn-default disabled">Загрузить на сайт</button>
            </div>
            <script>
                document.getElementById('upload').addEventListener('change', open_img, false);
            </script>
        </div>
    </div>
</div>
<!---->
<div class="bacground_content">
	<div class="main_width">
		<header>
            <div class="users_content">
                <div class="users">
                    <?php if (!isset($_SESSION['user'])) {;?>
                        <div class="users_block">
                            <button class="button" onclick="users_dropdown('off')"></button>
                            <a href="/login" class="login" data-toggle="tooltip" data-placement="bottom" title="Авторизация"><span>Логин</span></a>
                            <a href="/login/registration" class="registration" data-toggle="tooltip" data-placement="bottom" title="Регистрация"></a>
                        </div>
                        <div id="users_dropcontainer" class="drop_container">
                            <div id="users" class="block">
                                <div class="top"></div>
                                <div class="center">
                                    <form action="/" method="post">
                                        <input type="text" name="login" placeholder="Логин" class="form_text">
                                        <input type="password" name="pass" placeholder="Пароль" class="form_text">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="remember"> Запомнить?
                                            </label>
                                        </div>
                                        <button type="submit" class="form_ok" name="auth"><span>Войти</span></button>
                                        <?php if(!empty($error['login'])) {?>
                                        <script>show_info('error', '<?php echo hc($error['login'])?>')</script>
                                        <?php }
                                        if(!empty($error['password'])) {?>
                                            <script>show_info('error', '<?php echo hc($error['password'])?>')</script>
                                        <?php }
                                        if(!empty($error[0])) {?>
                                            <script>show_info('error', '<?php echo hc($error[0])?>')</script>
                                        <?php }?>
                                    </form>
                                </div>
                                <div class="bottom">
                                    <div class="cap_left"></div>
                                    <div class="cap_center"></div>
                                    <div class="cap_right"></div>
                                </div>
                            </div>
                        </div>
                    <?php } else {?>
                        <div class="users_block">
                            <button class="button" onclick="users_dropdown('on')"></button>
                            <a href="/login" class="login"><span><?php echo hc($_SESSION['user']['login']);?></span></a>
                        </div>
                        <div id="users_dropcontainer" class="drop_container">
                            <div id="users" class="block">
                                <div class="top"></div>
                                <div class="center">
                                    <div class="avatar">
                                        <?php if(!empty($_SESSION['user']['img'])) {?>
                                            <img src="<?php echo hc($_SESSION['user']['img']);?>" alt="<?php echo hc($_SESSION['user']['login']);?>">
                                        <?php } else {?>
                                            <img src="/skins/img/none_avatar.png" alt="avatar">
                                        <?php }?>
                                    </div>
                                    <div class="login">
                                        <p><?php echo hc($_SESSION['user']['login']);?></p>
                                    </div>
                                    <div class="fon">
                                        <div class="block">
                                            <div class="nik" data-toggle="tooltip" data-placement="right" title="Имя"></div>
                                            <p><?php echo hc($_SESSION['user']['name']);?></p>
                                        </div>
                                        <div class="block">
                                            <div class="email" data-toggle="tooltip" data-placement="right" title="Почта"></div>
                                            <p><?php echo hc($_SESSION['user']['email']);?></p>
                                        </div>
                                        <div class="block">
                                            <div class="role" data-toggle="tooltip" data-placement="right" title="Статус"></div>
                                            <p>
                                                <?php if($_SESSION['user']['role'] == 'user') {
                                                    echo 'Пользователь';
                                                } elseif ($_SESSION['user']['role'] == 'moderator') {
                                                    echo 'Модератор';
                                                } elseif ($_SESSION['user']['role'] == 'supermoderator') {
                                                    echo 'Супермодератор';
                                                } elseif ($_SESSION['user']['role'] == 'admin') {
                                                    echo 'Администратор';
                                                }?>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="fon_shop">
                                        <div class="header">Корзина</div>
                                        <?php if($count_goods != 0) {?>
                                            <a href="/shop" class="shop_ok"><?php echo hc($count_goods,1);?> товара</a>
                                        <?php } else {?>
                                            <div class="shop">Пусто</div>
                                        <?php }?>
                                    </div>
                                </div>
                                <div class="bottom">
                                    <a href="/login/edit" class="cap_left_edit" data-toggle="tooltip" data-placement="right" title="Настройки"></a>
                                    <?php if($_SESSION['user']['role'] == 'admin' || $_SESSION['user']['role'] == 'supermoderator') {?>
                                        <a href="/admin" class="cap_center_admin" data-toggle="tooltip" data-placement="right" title="Админка"></a>
                                    <?php } else {?>
                                        <a href="/login" class="cap_center_profile" data-toggle="tooltip" data-placement="right" title="Профил"></a>
                                    <?php }?>
                                    <a href="/login/exit" class="cap_right_exit" class="cap_center_profile" data-toggle="tooltip" data-placement="left" title="Выйти"></a>
                                </div>
                            </div>
                        </div>
                    <?php }?>
                </div>
                <div class="mini_users">
                    <a href="/shop" class="basket" data-toggle="tooltip" data-placement="bottom" title="Корзина"></a>
                </div>
            </div>
			<div class="logo_content">
				<img src="/skins/img/logo.png" alt="дота 1">
			</div>
            <img src="/skins/img/artas.png" class="mobile_artas" alt="дота 1">
			<nav>
				<div class="block1">
					<div class="top_pic"></div>
					<div class="block_top">
						<div class="pic_left"></div>
						<div class="pic"></div>
						<div class="pic_right"></div>
					</div>
					<div class="block_center">
						<?php if(!count($modules)) {?>
							<div class="pic_left"></div>
							<a href="/" class="pic_center">
								<img src="/skins/img/icon_home.png" alt="home" class="img">
								<div class="text">ГЛАВНАЯ</div>
							</a>
							<div class="pic_right"></div>
						<?php } elseif(count($modules) == 1) { ?>
							<div class="pic_left"></div>
							<a href="/" class="pic_center1">
								<img src="/skins/img/icon_home.png" alt="home" class="img">
								<div class="text">ГЛАВНАЯ</div>
							</a>
							<?php foreach ($modules as $mod) { ?>
								<?php if (count($mod['child'][0])) { ?>
									<div class="child">
										<div class="pic_center1" onclick="dota_dropdown(<?php echo hc($mod['id']);?>)">
											<img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
											<div class="text"><?php echo hc($mod['name']);?></div>
										</div>
										<div id="drop_container<?php echo hc($mod['id']);?>" class="drop_container">
											<div id="dota_dropdown<?php echo hc($mod['id']);?>" class="dota_dropdown_off">
                                                <div class="top"></div>
                                                <div class="repeat">
                                                    <a href="<?php echo hc($mod['href']);?>" class="head"><?php echo hc($mod['name']);?></a>
                                                    <?php foreach ($mod['child'] as $child) {?>
                                                        <a href="<?php echo hc($child['href']);?>" class="block">
                                                            <div class="img"></div>
                                                            <p><?php echo $child['name']?></p>
                                                            <div class="cursor"></div>
                                                        </a>
                                                    <?php }?>
                                                </div>
                                                <div class="bottom"></div>
											</div>
										</div>
									</div>
								<?php } else { ?>
									<a href="<?php echo hc($mod['href']);?>" class="pic_center1">
										<img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
										<div class="text"><?php echo hc($mod['name']);?></div>
									</a>
								<?php }
							}?>
							<div class="pic_right"></div>
						<?php } elseif(count($modules) == 2) { ?>
                            <div class="pic_left"></div>
                            <a href="/" class="pic_center2">
                                <img src="/skins/img/icon_home.png" alt="home" class="img">
                                <div class="text">ГЛАВНАЯ</div>
                            </a>
                            <?php foreach ($modules as $mod) {?>
                                <?php if (count($mod['child'][0])) {?>
                                    <div class="child">
                                        <div class="pic_center2" onclick="dota_dropdown(<?php echo hc($mod['id']);?>)">
                                            <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                            <div class="text"><?php echo hc($mod['name']);?></div>
                                        </div>
                                        <div id="drop_container<?php echo hc($mod['id']);?>" class="drop_container">
                                            <div id="dota_dropdown<?php echo hc($mod['id']);?>" class="dota_dropdown_off">
                                                <div class="top"></div>
                                                <div class="repeat">
                                                    <a href="<?php echo hc($mod['href']);?>" class="head"><?php echo hc($mod['name']);?></a>
                                                    <?php foreach ($mod['child'] as $child) {?>
                                                        <a href="<?php echo hc($child['href']);?>" class="block">
                                                            <div class="img"></div>
                                                            <p><?php echo $child['name']?></p>
                                                            <div class="cursor"></div>
                                                        </a>
                                                    <?php }?>
                                                </div>
                                                <div class="bottom"></div>
                                            </div>
                                        </div>
                                    </div>
                                <?php } else { ?>
                                    <a href="<?php echo hc($mod['href']);?>" class="pic_center2">
                                        <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                        <div class="text"><?php echo hc($mod['name']);?></div>
                                    </a>
                                <?php }
                            }?>
                            <div class="pic_right"></div>
                        <?php } elseif(count($modules) == 3) { ?>
                            <div class="pic_left"></div>
                            <a href="/" class="pic_center3">
                                <img src="/skins/img/icon_home.png" alt="home" class="img">
                                <div class="text">ГЛАВНАЯ</div>
                            </a>
                            <?php foreach ($modules as $mod) {?>
                                <?php if (count($mod['child'][0])) {?>
                                    <div class="child">
                                        <div class="pic_center3" onclick="dota_dropdown(<?php echo hc($mod['id']);?>)">
                                            <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                            <div class="text"><?php echo hc($mod['name']);?></div>
                                        </div>
                                        <div id="drop_container<?php echo hc($mod['id']);?>" class="drop_container">
                                            <div id="dota_dropdown<?php echo hc($mod['id']);?>" class="dota_dropdown_off">
                                                <div class="top"></div>
                                                <div class="repeat">
                                                    <a href="<?php echo hc($mod['href']);?>" class="head"><?php echo hc($mod['name']);?></a>
                                                    <?php foreach ($mod['child'] as $child) {?>
                                                        <a href="<?php echo hc($child['href']);?>" class="block">
                                                            <div class="img"></div>
                                                            <p><?php echo $child['name']?></p>
                                                            <div class="cursor"></div>
                                                        </a>
                                                    <?php }?>
                                                </div>
                                                <div class="bottom"></div>
                                            </div>
                                        </div>
                                    </div>
                                <?php } else { ?>
                                    <a href="<?php echo hc($mod['href']);?>" class="pic_center3">
                                        <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                        <div class="text"><?php echo hc($mod['name']);?></div>
                                    </a>
                                <?php }
                            }?>
                            <div class="pic_right"></div>
                        <?php } elseif(count($modules) == 4) { ?>
                            <div class="pic_left"></div>
                            <a href="/" class="pic_center4">
                                <img src="/skins/img/icon_home.png" alt="home" class="img">
                                <div class="text">ГЛАВНАЯ</div>
                            </a>
                            <?php foreach ($modules as $mod) {?>
                                <?php if (count($mod['child'][0])) {?>
                                    <div class="child">
                                        <div class="pic_center4" onclick="dota_dropdown(<?php echo hc($mod['id']);?>)">
                                            <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                            <div class="text"><?php echo hc($mod['name']);?></div>
                                        </div>
                                        <div id="drop_container<?php echo hc($mod['id']);?>" class="drop_container">
                                            <div id="dota_dropdown<?php echo hc($mod['id']);?>" class="dota_dropdown_off">
                                                <div class="top"></div>
                                                <div class="repeat">
                                                    <a href="<?php echo hc($mod['href']);?>" class="head"><?php echo hc($mod['name']);?></a>
                                                    <?php foreach ($mod['child'] as $child) {?>
                                                        <a href="<?php echo hc($child['href']);?>" class="block">
                                                            <div class="img"></div>
                                                            <p><?php echo $child['name']?></p>
                                                            <div class="cursor"></div>
                                                        </a>
                                                    <?php }?>
                                                </div>
                                                <div class="bottom"></div>
                                            </div>
                                        </div>
                                    </div>
                                <?php } else { ?>
                                    <a href="<?php echo hc($mod['href']);?>" class="pic_center4">
                                        <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                        <div class="text"><?php echo hc($mod['name']);?></div>
                                    </a>
                                <?php }
                            }?>
                            <div class="pic_right"></div>
                        <?php }?>
                     </div>
                    <div class="block_center_mobile">
                        <div class="pic_left"></div>
                        <div class="pic_center" onclick="nav_mobile()">
                            <div class="nav_pic">
                                <span>Навигация</span>
                            </div>
                        </div>
                        <div class="pic_right"></div>
                    </div>
                    <div class="block_bottom">
                        <div class="pic_left"></div>
                        <div class="pic"></div>
                        <div class="pic_right"></div>
                    </div>
                </div>
                <?php if(isset($modules2) && (count($modules2))) {
                    if(count($modules2) < 5) {?>
                        <div class="rog_left"></div>
                    <?php }?>
                    <div class="block2">
                        <div class="block_top">
                            <div class="pic_left"></div>
                            <?php if(count($modules2) == 1) {?>
                                <div class="pic1"></div>
                            <?php } elseif(count($modules2) == 2) {?>
                                <div class="pic2"></div>
                            <?php } elseif(count($modules2) == 3) {?>
                                <div class="pic3"></div>
                            <?php } elseif(count($modules2) == 4) {?>
                                <div class="pic4"></div>
                            <?php } elseif(count($modules2) == 5) {?>
                                <div class="pic"></div>
                            <?php }?>
                            <div class="pic_right"></div>
                        </div>
                        <div class="block_center">
                            <?php if(count($modules2) == 1) { ?>
                                <div class="pic_left"></div>
                                <?php foreach ($modules2 as $mod) { ?>
                                    <?php if (count($mod['child'][0])) {?>
                                        <div class="child1">
                                            <div class="pic_center4" onclick="dota_dropdown(<?php echo hc($mod['id']);?>)">
                                                <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                                <div class="text"><?php echo hc($mod['name']);?></div>
                                            </div>
                                            <div id="drop_container<?php echo hc($mod['id']);?>" class="drop_container">
                                                <div id="dota_dropdown<?php echo hc($mod['id']);?>" class="dota_dropdown_off">
                                                    <div class="top"></div>
                                                    <div class="repeat">
                                                        <a href="<?php echo hc($mod['href']);?>" class="head"><?php echo hc($mod['name']);?></a>
                                                        <?php foreach ($mod['child'] as $child) {?>
                                                            <a href="<?php echo hc($child['href']);?>" class="block">
                                                                <div class="img"></div>
                                                                <p><?php echo $child['name']?></p>
                                                                <div class="cursor"></div>
                                                            </a>
                                                        <?php }?>
                                                    </div>
                                                    <div class="bottom"></div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } else { ?>
                                        <a href="<?php echo hc($mod['href']);?>" class="pic_center4">
                                            <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                            <div class="text"><?php echo hc($mod['name']);?></div>
                                        </a>
                                    <?php }
                                }?>
                                <div class="pic_right"></div>
                            <?php } elseif(count($modules2) == 2) { ?>
                                <div class="pic_left"></div>
                                <?php foreach ($modules2 as $mod) {?>
                                    <?php if (count($mod['child'][0])) {?>
                                        <div class="child1">
                                            <div class="pic_center4" onclick="dota_dropdown(<?php echo hc($mod['id']);?>)">
                                                <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                                <div class="text"><?php echo hc($mod['name']);?></div>
                                            </div>
                                            <div id="drop_container<?php echo hc($mod['id']);?>" class="drop_container">
                                                <div id="dota_dropdown<?php echo hc($mod['id']);?>" class="dota_dropdown_off">
                                                    <div class="top"></div>
                                                    <a href="" class="repeat">
                                                        <div class="head"><?php echo hc($mod['name']);?></div>
                                                        <?php foreach ($mod['child'] as $child) {?>
                                                            <div class="block">
                                                                <div class="img"></div>
                                                                <p><?php echo $child['name']?></p>
                                                                <div class="cursor"></div>
                                                            </div>
                                                        <?php }?>
                                                    </a>
                                                    <div class="bottom"></div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } else { ?>
                                        <a href="<?php echo hc($mod['href']);?>" class="pic_center4">
                                            <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                            <div class="text"><?php echo hc($mod['name']);?></div>
                                        </a>
                                    <?php }
                                }?>
                                <div class="pic_right"></div>
                            <?php } elseif(count($modules2) == 3) { ?>
                                <div class="pic_left"></div>
                                <?php foreach ($modules2 as $mod) {?>
                                    <?php if (count($mod['child'][0])) {?>
                                        <div class="child1">
                                            <div class="pic_center4" onclick="dota_dropdown(<?php echo hc($mod['id']);?>)">
                                                <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                                <div class="text"><?php echo hc($mod['name']);?></div>
                                            </div>
                                            <div id="drop_container<?php echo hc($mod['id']);?>" class="drop_container">
                                                <div id="dota_dropdown<?php echo hc($mod['id']);?>" class="dota_dropdown_off">
                                                    <div class="top"></div>
                                                    <div class="repeat">
                                                        <a href="<?php echo hc($mod['href']);?>" class="head"><?php echo hc($mod['name']);?></a>
                                                        <?php foreach ($mod['child'] as $child) {?>
                                                            <a href="<?php echo hc($child['href']);?>" class="block">
                                                                <div class="img"></div>
                                                                <p><?php echo $child['name']?></p>
                                                                <div class="cursor"></div>
                                                            </a>
                                                        <?php }?>
                                                    </div>
                                                    <div class="bottom"></div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } else { ?>
                                        <a href="<?php echo hc($mod['href']);?>" class="pic_center4">
                                            <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                            <div class="text"><?php echo hc($mod['name']);?></div>
                                        </a>
                                    <?php }
                                }?>
                                <div class="pic_right"></div>
                            <?php } elseif(count($modules2) == 4) { ?>
                                <div class="pic_left"></div>
                                <?php foreach ($modules2 as $mod) {?>
                                    <?php if (count($mod['child'][0])) {?>
                                        <div class="child1">
                                            <div class="pic_center4" onclick="dota_dropdown(<?php echo hc($mod['id']);?>)">
                                                <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                                <div class="text"><?php echo hc($mod['name']);?></div>
                                            </div>
                                            <div id="drop_container<?php echo hc($mod['id']);?>" class="drop_container">
                                                <div id="dota_dropdown<?php echo hc($mod['id']);?>" class="dota_dropdown_off">
                                                    <div class="top"></div>
                                                    <div class="repeat">
                                                        <a href="<?php echo hc($mod['href']);?>" class="head"><?php echo hc($mod['name']);?></a>
                                                        <?php foreach ($mod['child'] as $child) {?>
                                                            <a href="<?php echo hc($child['href']);?>" class="block">
                                                                <div class="img"></div>
                                                                <p><?php echo $child['name']?></p>
                                                                <div class="cursor"></div>
                                                            </a>
                                                        <?php }?>
                                                    </div>
                                                    <div class="bottom"></div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } else { ?>
                                        <a href="<?php echo hc($mod['href']);?>" class="pic_center4">
                                            <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                            <div class="text"><?php echo hc($mod['name']);?></div>
                                        </a>
                                    <?php }
                                }?>
                                <div class="pic_right"></div>
                            <?php } elseif(count($modules2) == 5) { ?>
                                <div class="pic_left"></div>
                                <?php foreach ($modules2 as $mod) {?>
                                    <?php if (count($mod['child'][0])) {?>
                                        <div class="child1">
                                            <div class="pic_center4" onclick="dota_dropdown(<?php echo hc($mod['id']);?>)">
                                                <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                                <div class="text"><?php echo hc($mod['name']);?></div>
                                            </div>
                                            <div id="drop_container<?php echo hc($mod['id']);?>" class="drop_container">
                                                <div id="dota_dropdown<?php echo hc($mod['id']);?>" class="dota_dropdown_off">
                                                    <div class="top"></div>
                                                    <div class="repeat">
                                                        <a href="<?php echo hc($mod['href']);?>" class="head"><?php echo hc($mod['name']);?></a>
                                                        <?php foreach ($mod['child'] as $child) {?>
                                                            <a href="<?php echo hc($child['href']);?>" class="block">
                                                                <div class="img"></div>
                                                                <p><?php echo $child['name']?></p>
                                                                <div class="cursor"></div>
                                                            </a>
                                                        <?php }?>
                                                    </div>
                                                    <div class="bottom"></div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } else { ?>
                                        <a href="<?php echo hc($mod['href']);?>" class="pic_center4">
                                            <img src="/uploads/nav1.png" alt="<?php echo hc($mod['name']);?>">
                                            <div class="text"><?php echo hc($mod['name']);?></div>
                                        </a>
                                    <?php }
                                }?>
                                <div class="pic_right"></div>
                            <?php }?>
                        </div>
                        <div class="block_bottom">
                            <div class="pic_left"></div>
                            <?php if(count($modules2) == 1) {?>
                                <div class="pic1"></div>
                            <?php } elseif(count($modules2) == 2) {?>
                                <div class="pic2"></div>
                            <?php } elseif(count($modules2) == 3) {?>
                                <div class="pic3"></div>
                            <?php } elseif(count($modules2) == 4) {?>
                                <div class="pic4"></div>
                            <?php } elseif(count($modules2) == 5) {?>
                                <div class="pic"></div>
                            <?php } ?>
                            <div class="pic_right"></div>
                        </div>
                    </div>
                    <?php if(count($modules2) < 5) {?>
                        <div class="rog_right"></div>
                    <?php }
                }?>
                <div id="nav_mobile" class="nav_mobile">
                    <div class="devil_pic"></div>
                    <div class="nav_block">
                        <a href="/" class="name_block">
                            <div class="name_left"></div>
                            <div class="name_center">
                                <span class="head_text">Главная</span>
                            </div>
                            <div class="name_right"></div>
                        </a>
                        <?php if(isset($modules) && count($modules)) {
                            foreach ($modules as $mod1) {?>
                                <a href="<?php echo hc($mod1['href'])?>" class="name_block">
                                    <div class="name_left"></div>
                                    <div class="name_center">
                                        <span class="head_text"><?php echo hc($mod1['name'])?></span>
                                    </div>
                                    <div class="name_right"></div>
                                </a>
                            <?php }
                        }
                        if(isset($modules2) && count($modules2)) {
                            foreach ($modules2 as $mod2) {?>
                                <a href="<?php echo hc($mod2['href'])?>" class="name_block">
                                    <div class="name_left"></div>
                                    <div class="name_center">
                                        <span class="head_text"><?php echo hc($mod2['name'])?></span>
                                    </div>
                                    <div class="name_right"></div>
                                </a>
                            <?php }
                        }?>
                    </div>
                </div>
			</nav>
			<div class="clear"></div>
		</header>
		<div class="content_fone">
			<div class="elements">
				<div class="stone">
					<div class="tree1"></div>
					<div class="fon"></div>
				</div>
				<div class="side_panel">
					<div class="artas">
						<div class="video_box">
							<div class="player">
								<div class="flowplayer">
									<video itemscope itemtype="http://schema.org/VideoGame">
										<source itemprop="trailer" type="video/mp4" src="/uploads/dota1.mp4">
										<source itemprop="trailer" type="video/webm" src="/uploads/dota1.webm">
										<source itemprop="trailer" type="video/ogg" src="/uploads/dota1.ogg">
										<source itemprop="trailer" type="video/flash" src="/uploads/dota1.flv">
									</video>
								</div>
							</div>
							<a href="#" class="dota"></a>
						</div>
					</div>
					<div class="tree2"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--content-->
<div class="content_block">
	<!--Главный контент сайта-->
	<div class="content_left">
		<main>
			<?=$content;?>
		</main>
	</div>
	<!--Бокавая панель-->
	<div class="content_right">
		<div class="lenta">
			<div class="tree"></div>
			<div class="top"></div>
			<div class="block">
				<div class="dota_panel">
					<div id="panel_create"></div>
					<div id="init_panel">
						<div class="header">
							<div></div>
							<p>Новые версии Dota</p>
						</div>
						<div class="news">
							<div class="window">
								<div class="img"></div>
							</div>
							<a href="#">Dota 6.83d</a>
						</div>
						<div class="news">
							<div class="window">
								<div class="img"></div>
							</div>
							<a href="#">Dota 6.81 AI</a>
						</div>
					</div>
				</div>
			</div>
			<div class="bottom"></div>
		</div>
	</div>
</div>
<footer>
	<div class="block_footer">
		<div class="footer_fon">
			<!--lines-->
			<div class="line_left"></div>
			<div class="line_right"></div>
			<!--Trees top-->
			<div class="tree">
				<div class="tree_left"></div>
				<div class="tree_right"></div>
				<div class="tree_left_mobile"></div>
				<div class="tree_right_mobile"></div>
			</div> <!--Trees top-->
			<!--Footer-->
			<div class="block">
				<div class="center">
					<div class="footer_content">
						<div class="mobile_repeat">
							<img src="/skins/img/f_logo.png" alt="Dota1">
						</div>
						<div class="mobile_repeat_bottom">
							<p>Системные требования PC/MAC</p>
							<small>
								1,3 ГБ на жестком диске
								128 (XP) или 512 (Vista) МБ ОЗУ
								Windows Vista®, Windows® XP
								Процессор Pentium II 400 МГц (...
								<a href="">подробнее</a>
							</small>
						</div>
						<div class="top_content">
							<div class="block_content">
								<div class="left"></div>
								<div class="repeat"></div>
								<div class="right"></div>
							</div>
							<div class="footer_top_pic"></div>
						</div>
						<div class="center_content">
							<div class="left"></div>
							<div class="repeat">
								<img src="/skins/img/f_logo.png" alt="Dota1">
							</div>
							<div class="repeat">
								<p>Системные требования PC/MAC</p>
								<small>
									1,3 ГБ на жестком диске
									128 (XP) или 512 (Vista) МБ ОЗУ
									Windows Vista®, Windows® XP
									Процессор Pentium II 400 МГц (...
									<a href="">подробнее</a>
								</small>
							</div>
							<div class="repeat">
								<div class="block">
									<a href="" class="pegi"></a>
									<a href="" class="violence"></a>
								</div>
							</div>
							<div class="right"></div>
						</div>
						<div class="bottom_content">
							<div class="left"></div>
							<div class="repeat"></div>
							<div class="right"></div>
						</div>
					</div>
				</div>
				<div class="sentinal"></div>
				<div class="scourge"></div>
			</div> <!--Footer-->
		</div>
		<div class="footer_pic"></div>
	</div>
</footer>

<link href="/skins/components/custom/flowplayer/skin/skin.css" rel="stylesheet">
<link href="/skins/components/bower/fancybox/dist/jquery.fancybox.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/skins/components/bower/slick-carousel/slick/slick.css">
<link rel="stylesheet" type="text/css" href="/skins/components/bower/slick-carousel/slick/slick-theme.css">
<link  href="/skins/components/bower/cropperjs/dist/cropper.min.css" rel="stylesheet">
<script>
	var antixsrf = '<?php echo (isset($_SESSION['antixsrf']) ? $_SESSION['antixsrf'] : 'no'); ?>';
</script>
<!--[if lt IE 9]>
<script src="/skins/components/bower/html5shiv/dist/html5shiv.min.js"></script>
<script src="/skins/components/bower/respond/dest/respond.min.js"></script>
<![endif]-->
<script src="/skins/components/bower/popper.js/dist/umd/popper.min.js"></script>
<script src="/skins/components/bower/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/skins/components/custom/flowplayer/flowplayer.min.js"></script>
<script src="/skins/components/bower/fancybox/dist/jquery.fancybox.min.js"></script>
<script src="/skins/components/custom/jQueryZoom/jquery.zoom.min.js"></script>
<script src="/skins/components/bower/slick-carousel/slick/slick.min.js"></script>
<script src="/skins/components/bower/cropperjs/dist/cropper.min.js"></script>
<script src="/vendor/schoolphp/library/Core/fw.min.js"></script>

<?php //echo \Core::$END; ?>
</body>
</html>