<!DOCTYPE html>
<html lang="<?php echo Core::$LANGUAGE['html_locale']; ?>">
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
	<?php echo Core::$META['head']; ?>
	<link rel="icon" href="/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="apple-touch-icon" href="/touch-icon-iphone.png">
	<link rel="apple-touch-icon" sizes="76x76" href="/touch-icon-ipad.png">
	<link rel="apple-touch-icon" sizes="120x120" href="/touch-icon-iphone-retina.png">
	<link rel="apple-touch-icon" sizes="152x152" href="/touch-icon-ipad-retina.png">
	<link href="/skins/components/bower/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="/skins/components/bower/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
	<!--<link href="/skins/components/node_modules/font-awesome/css/font-awesome.min.css" rel="stylesheet">-->
    <!--Croppie-->
    <link  href="/skins/components/bower/cropperjs/dist/cropper.min.css" rel="stylesheet">
    <!---->
	<link href="/skins<?php echo Core::$SKIN;?>/css/admin.min.css" rel="stylesheet">
	<script>
		var antixsrf = '<?php echo (isset($_SESSION['antixsrf']) ? $_SESSION['antixsrf'] : 'no'); ?>';
	</script>
	<!--[if lt IE 9]>
	<script src="/skins/components/bower/html5shiv/dist/html5shiv.min.js" defer></script>
	<script src="/skins/components/bower/respond/dest/respond.min.js" defer></script>
	<![endif]-->
	<script src="/skins/components/bower/jquery/dist/jquery.min.js"></script>
	<script src="/skins/components/bower/popper.js/dist/umd/popper.min.js"></script>
	<script src="/skins/components/bower/bootstrap/dist/js/bootstrap.min.js"></script>
    <!--CKEDITOR-->
    <script src="/skins/components/custom/ckeditor/ckeditor.js"></script>
    <!---->
    <!--Cropperjs-->
    <script src="/skins/components/bower/cropperjs/dist/cropper.min.js"></script>
    <!---->
	<script src="/vendor/schoolphp/library/Core/fw.min.js" defer></script>
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

<!-- Modal Templates-->
<div class="modal fade" id="template" tabindex="-1" role="dialog" aria-labelledby="modal_header_template">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<div id="modal_header_template" class="modal-title">Выберите шаблон</div>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<div class="pic_one"></div>
							<div class="caption">
								<div class="header">Одиночный шаблон</div>
								<p class="text">В этот шаблон входит загаловок и блок с текстом. Он подходит для страниц с описанием чего либо</p>
								<p><button type="button" class="btn btn-default" data-dismiss="modal" onclick="create_template('one');">Выбрать</button></p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<div class="pic_table"></div>
							<div class="caption">
								<div class="header">Табличный шаблон</div>
								<p class="text">В этот шаблон входит загаловок и список с данными. Он подходит для создание страниц с новостьями, статьями, представлениеми предметов или со списком персонажей доты</p>
								<p><button type="button" class="btn btn-default" data-dismiss="modal" onclick="create_template('table');">Выбрать</button></p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<div class="pic_gal"></div>
							<div class="caption">
								<div class="header">Галерейный шаблон</div>
								<p class="text">В этот шаблон входит загаловок и ячейки с картинами. Он подходит для создание галерейных страниц</p>
								<p><button type="button" class="btn btn-default" data-dismiss="modal" onclick="create_template('gal');">Выбрать</button></p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<div class="pic_carusel"></div>
							<div class="caption">
								<div class="header">Карусельный шаблон</div>
								<p class="text">В этот шаблон входит загаловок и слайдер с картинами. Этот шаблон можно создать без загалока. Он подходит для создание слайдеров с рекламой</p>
								<p><button type="button" class="btn btn-default" data-dismiss="modal" onclick="create_template('carusel');">Выбрать</button></p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<div class="pic_magazine"></div>
							<div class="caption">
								<div class="header">Интернет магазин</div>
								<p class="text">В этот шаблон входит загаловок и список товаров. Он подходит для создание страниц с товарами. Выберите этот шаблон если хотите сделать интеренет магазин</p>
								<p><button type="button" class="btn btn-default" data-dismiss="modal" onclick="create_template('magazine');">Выбрать</button></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal Delete-->
<div class="modal fade bs-example-modal-s" id="delete" tabindex="-1" role="dialog" aria-labelledby="modal_header_del_adm">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div id="modal_header_del_adm" class="modal-title">Внимание!</div>
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
<div class="modal fade bs-example-modal-lg" id="crop" tabindex="-1" role="dialog" aria-labelledby="modal_header_img_adm">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div id="modal_header_img_adm" class="modal-title"></div>
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

<div class="bacground_content <?php if(isAdmin()) {?>admin_top_fon<?php }?>">
	<div class="container">
		<?php if(isAdmin()) { /* Login */ ?>
			<header>
				<img class="logo" src="/skins/img/logo.png" alt="дота 1">
				<div class="row">
					<div class="col-md-8">
						<nav>
							<div class="top_pic"></div>
							<div class="block">
								<div class="block_top">
									<div class="pic_left"></div>
									<div class="pic"></div>
									<div class="pic_right"></div>
								</div>
								<div class="block_center">
									<div class="pic_left"></div>
									<a href="/admin" class="pic_center">
										<img src="/skins/img/icon_home.png" alt="home" class="main">
										<div class="text">ГЛАВНАЯ</div>
									</a>
                                    <?php if($_SESSION['user']['role'] == 'admin') {?>
                                        <a href="/admin/module" class="pic_center">
                                            <img src="/uploads/nav1.png" alt="modules">
                                            <div class="text">Модули</div>
                                        </a>
                                    <?php } else {?>
                                        <div class="pic_center" data-toggle="tooltip" data-placement="bottom" title="Требуется права доступа Админ">
                                            <img src="/uploads/item_off.png" alt="modules">
                                            <div class="text">Модули</div>
                                        </div>
                                    <?php }?>
									<a href="/admin/data" class="pic_center">
										<img src="/uploads/nav1.png" alt="modules">
										<div class="text">Данные</div>
									</a>
									<a href="/admin/users" class="pic_center">
										<img src="/uploads/nav1.png" alt="modules">
										<div class="text">Пользователи</div>
									</a>
									<a href="/admin/users" class="pic_center">
										<img src="/uploads/nav1.png" alt="modules">
										<div class="text">Настроики</div>
									</a>
									<div class="pic_right"></div>
								</div>
								<div class="block_bottom">
									<div class="pic_left"></div>
									<div class="pic"></div>
									<div class="pic_right"></div>
								</div>
							</div>
						</nav>
					</div>
					<div class="col-md-4">
						<div class="users">
                            <div class="login"><span><?php echo hc($_SESSION['user']['login']);?></span></div>
                            <div class="block_buttons">
                                <div class="status">
                                    <?php if($_SESSION['user']['role'] == 'admin') {
                                        echo 'Администратор';
                                    } elseif($_SESSION['user']['role'] == 'supermoderator') {
                                        echo 'Супермодератор';
                                    }?>
                                </div>
                                <a href="/" class="exit_site" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Выйти в сайт"></a>
                                <a href="/login/exit" class="exit_login" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Деавторизироваться"></a>
                            </div>
                        </div>
					</div>
				</div>
			</header>
		<?php } ?>
		<div class="content_fone <?php if(!isAdmin()) {?>content_fon_admin<?php } ?>">
            <?php if(!isAdmin()) {?>
                <div class="admin_enter_top"></div>
            <?php } ?>
			<div class="elements">
				<div class="stone">
					<div class="tree1"></div>
					<div class="fon"></div>
				</div>
				<div class="side_panel">
					<div class="tree2"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--content-->
<div class="clear"></div>
<div class="container">
	<main>
        <?php if(!isAdmin()) {?>
            <div class="admin_enter_left"></div>
            <div class="admin_enter_right"></div>
        <?php } ?>
		<div class="content_block">
			<?php echo $content; ?>
		</div>
	</main>
</div>

<footer>
	<div class="container">
		<div class="footer_block">
			<div class="block">
				<div class="block">
					<div class="center">
						<div class="footer_content">
							<div class="mobile_repeat">
								<img src="/skins/img/f_logo.png" alt="Dota1">
							</div>
							<div class="mobile_repeat_bottom">
								<p>Подвал Админки</p>
								<small>
									Общая число модулей - 18
								</small>
								<small>
									Общая число данных -
								</small>
								<small>
									Общая число пользователей -
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
									<p>Статистика Сайта</p>
									<small>
										Общая число модулей - <span>16</span>
									</small>
									<small>
										Общая число данных - <span>24</span>
									</small>
									<small>
										Общая число пользователей - <span>8</span>
									</small>
								</div>
								<div class="repeat">
									<div class="block">
										<p>Руководства пользователя</p>
										<a href="#" class="doc">Прочитать</a>
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
				</div>
			</div>
		</div>
	</div>
</footer>
<?php //echo \Core::$END; ?>
</body>
</html>