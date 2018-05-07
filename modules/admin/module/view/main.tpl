<div class="main_header">
    <div class="header_left"></div>
    <div class="header_center">
        <span>Модули сайта</span>
    </div>
    <div class="header_right"></div>
</div>
<p class="info"><b>Модули</b> - главные страницы сайта отображаемой в навигаций и страницы находящиеся внутри других модулей. На данной странице вы можете редактировать модули сайта. Будьте осторожны при удалений модулей, так как вместе с модулем удалится вся инфа что есть в данном модуле</p>

<form action="" method="post">
    <div class="adm_unit">
        <div class="left"></div>
        <div class="right">
            <a class="btn btn-default" href="/admin/module/add" data-toggle="tooltip" data-placement="bottom" title="Добавить модуль">
                <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
            </a>
            <input type="submit" name="del" value="Del" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Удалить запись">
        </div>
    </div>
    <?php while($set_modules = $modules->fetch_assoc()) {?>
        <div class="module_block">
            <div class="left"></div>
            <div class="center">
                <div class="checkd"><input type="checkbox" name="ids[]" value="<?php echo hc($set_modules['id']);?>"></div>
                <button class="module_button" type="button" onclick="getModule('<?php echo hc($set_modules['id'])?>','<?php echo hc($set_modules['name'])?>');"><span><?php echo hc($set_modules['name']);?></span></button>
                <a href="/admin/module/edit?id=<?php echo hc($set_modules['id']);?>&parent=<?php echo hc($set_modules['id']);?>" class="btn btn-default">Изменить</a>
            </div>
            <div class="right"></div>
        </div>
        <div id="module_create<?php echo hc($set_modules['id']);?>"></div>
    <?php }?>
</form>