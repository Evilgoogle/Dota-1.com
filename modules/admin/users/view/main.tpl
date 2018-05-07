<div class="main_header">
    <div class="header_left"></div>
    <div class="header_center">
        <span>Пользователи</span>
    </div>
    <div class="header_right"></div>
</div>
<p class="info"><b>Пользователи</b> - это страница предназначена для добавление, редактирование и удаление пользователей сайта. Здесь вы можете выдовать права пользователям, забанить их или активировать</p>

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
        <a class="btn btn-default" href="/admin/users/add" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Добавить пользователя">
            <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
        </a>
        <input type="submit" name="del" value="Del" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Удалить пользователя">
    </div>
</div>

<?php
if($users->num_rows) {
    while ($set_users = $users->fetch_assoc()) {?>
        <div class="module_block">
            <div class="left"></div>
            <div class="center">
                <div class="checkd"><input type="checkbox" name="ids[]" value="9"></div>
                <button class="module_button" type="button" onclick="openModule(<?php echo hc($set_users['id']);?>)"><span><?php echo hc($set_users['login']);?></span></button>
                <a href="/admin/users/edit?id=<?php echo hc($set_users['id']);?>&login=<?php echo hc($set_users['login']);?>&email=<?php echo hc($set_users['email']);?>" class="btn btn-default">
                    <div class="glyphicon glyphicon-edit" aria-hidden="true"></div>
                </a>
            </div>
            <div class="right"></div>
        </div>
        <div id="openModule<?php echo hc($set_users['id']);?>" class="module">
            <div class="fon_top"></div>
            <div class="fon_bottom users_fon_bottom"></div>
            <div class="templates users_template">
                <div class="users_block">
                    <div class="left">
                        <div class="left_fon">
                            <div class="avatar">
                                <?php if(!empty($set_users['img'])) {?>
                                    <img src="<?php echo hc($set_users['img']);?>" alt="<?php echo hc($set_users['login']);?>">
                                <?php } else {?>
                                    <img src="/skins/img/none_avatar.png" alt="avatar">
                                <?php }?>
                            </div>
                            <a href="/admin/users/access?id=<?php echo hc($set_users['id']);?>&active=<?php echo hc($_SESSION['user']['id']);?>" class="access">
                            <span>
                                <?php if($set_users['role'] == 'admin') {
                                    echo 'Администратор';
                                } elseif ($set_users['role'] == 'supermoderator') {
                                    echo 'Супермодератор';
                                } elseif ($set_users['role'] == 'moderator') {
                                    echo 'Модератор';
                                } elseif ($set_users['role'] == 'user') {
                                    echo 'Пользователь';
                                }?>
                            </span>
                            </a>
                        </div>
                        <div class="users_id"><?php echo hc($set_users['id']);?></div>
                    </div>
                    <div class="right">
                        <div class="name"><span><?php echo hc($set_users['name']);?></span></div>
                        <div class="communication">
                            <div class="mail">
                                <div class="icon"></div>
                                <div class="text"><?php echo hc($set_users['email']);?></div>
                            </div>
                            <div class="skype">
                                <div class="icon"></div>
                                <div class="text"><?php echo hc($set_users['skype']);?></div>
                            </div>
                        </div>
                        <div class="user_info"><span class="info_i">Дата Регистраций</span> <?php echo hc($set_users['date']);?></div>
                        <div class="user_info"><span class="info_i">Был на сайте</span> <?php echo hc($set_users['lastactive']);?></div>
                        <div class="user_info"><span class="info_i">Ip</span> <?php echo hc($set_users['ip']);?></div>
                        <div class="user_info"><span class="info_i">Браузер</span> <?php echo hc($set_users['browser']);?></div>
                    </div>
                </div>
            </div>
        </div>
    <?php }
} else { ?>
    <div class="module_block">Не найден такой пользователь - <b><?php echo @hc($_GET['search'],1);?></b></div>
<?php } ?>
