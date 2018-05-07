<div class="main_header">
    <div class="header_left"></div>
    <div class="header_center">
        <span>Изменить права пользователя - <?php echo hc($set['login']);?></span>
    </div>
    <div class="header_right"></div>
</div>
<?php if($_GET['id'] != $_GET['active']) {?>
    <div class="row">
    <div class="col-lg-12">
        <div class="form_top"></div>
        <div class="form_center">
            <?php if(isset($error['name'])) {?>
                <div class="alert alert-danger" role="alert"><?php echo hc($error['name']);?></div>
            <?php }
            if(isset($error['mini'])) {?>
                <div class="alert alert-danger" role="alert"><?php echo hc($error['mini']);?></div>
            <?php }
            if(isset($error['preview'])) {?>
                <div class="alert alert-danger" role="alert"><?php echo hc($error['preview']);?></div>
            <?php }?>
            <form action="" method="post">
                <div class="form-group">
                    <label for="exampleInputPassword1" class="hint">Права</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
                            </div>
                        </div>
                        <select class="form-control" name="access">
                            <option <?php if($set['role'] == 'admin') {?>selected<?php }?> value="admin">Администратор</option>
                            <option <?php if($set['role'] == 'supermoderator') {?>selected<?php }?> value="supermoderator">Супермодератор</option>
                            <option <?php if($set['role'] == 'moderator') {?>selected<?php }?> value="moderator">Модератор</option>
                            <option <?php if($set['role'] == 'user') {?>selected<?php }?> value="user">Пользователь</option>
                        </select>
                        <div class="input-group-btn">
                            <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Выбирети шаблон если хотите переместить данную запись в другой шаблон, если нет то оставляйте поле как было. Здесь появится на выбор все табличные шаблоны что есть на сайте. Шаблоны могут находится в разных модулях">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="submit" name="ok" class="btn btn-default" value="Поменять">
            </form>
        </div>
        <div class="form_bottom"></div>
    </div>
</div>
<?php } else {?>
    <p class="info"><b>Ошибка</b> - Вы не можете поменять свои права! Этого можно сделать находясь в другом акаунте</p>
<?php }?>
