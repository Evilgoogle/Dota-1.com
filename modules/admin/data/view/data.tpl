<div class="main_header">
    <div class="header_left"></div>
    <div class="header_center">
        <span>Данные</span>
    </div>
    <div class="header_right"></div>
</div>
<p class="info"><b>Данные</b> - это страница предназначена для добавление, редактирование и удаление данных в модулях сайта.</p>
<?php while ($set_modules = $modules->fetch_assoc()) {?>
    <div class="module_block">
        <div class="left"></div>
        <button class="center" onclick="openModule(<?php echo hc($set_modules['id']);?>)"><span><?php echo hc($set_modules['name']);?></span></button>
        <div class="right"></div>
    </div>
    <div id="openModule<?php echo hc($set_modules['id']);?>" class="module">
        <div class="fon_top"></div>
        <div class="fon_bottom"></div>
        <div class="templates">
            <?php foreach ($templates as $template) {
                if($set_modules['id'] == $template['module_id']) {?>
                    <form action="" method="post" id="data_form<?php echo hc($template['template_id']);?>">
                        <div class="header">
                            <div class="left">
                                <div class="pic"></div>
                                <div class="text">
                                    <?php if($template['template'] == 'one') {
                                        echo 'Одиночный шаблон - ';
                                        $stub = true;
                                    } else if($template['template'] == 'table') {
                                        echo 'Табличный шаблон - ';
                                        $template_add = 'table_add';
                                        $stub = false;
                                    } else if($template['template'] == 'gal') {
                                        echo 'Галерейный шаблон - ';
                                        $template_add = 'gal_add';
                                        $stub = false;
                                    } else if($template['template'] == 'carusel') {
                                        echo 'Карусельный шаблон - ';
                                        $template_add = 'carusel_add';
                                        $stub = false;
                                    } else if($template['template'] == 'magazine') {
                                        echo 'Магазинный шаблон - ';
                                        $template_add = 'magazine_add';
                                        $stub = false;
                                    }
                                    echo hc($template['template_id'])?>
                                </div>
                            </div>
                            <div class="right">
                                <?php if($stub !== true) {?>
                                    <a class="btn btn-default" href="/admin/data/<?php echo $template_add;?>?module_id=<?php echo hc($set_modules['id']);?>&template_id=<?php echo hc($template['template_id']);?>&itemtype=<?php echo hc($template['itemscope']);?>" role="button">
                                        <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
                                    </a>
                                    <input type="submit" name="del" value="DEL" class="btn btn-default">
                                <?php }?>
                            </div>
                        </div>
                        <div class="block">
                            <?php if($template['template'] == 'one') {
                                foreach ($data as $val) {
                                    if($val['module_id'] == $set_modules['id']) {
                                        if($val['template_id'] == $template['template_id']) {?>
                                            <div class="on_form">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1" class="hint">Itemprop</label>
                                                    <div class="input-group">
                                                        <div class="input-group-btn">
                                                            <div class="btn pseudo_left">
                                                                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                                            </div>
                                                        </div>
                                                        <!-->
                                                        <input type="text" class="form-control" name="one[<?php echo hc($template['template_id']);?>][itemprop_text]" value="<?php echo hc($val['itemprop_text']);?>">
                                                        <!-->
                                                        <div class="input-group-btn">
                                                            <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Введите название">
                                                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1" class="hint">Текст</label>
                                                    <textarea id="one<?php echo hc($template['template_id']);?>" name="one[<?php echo hc($template['template_id']);?>][text]" class="form-control"><?php echo hc($val['text']);?></textarea>
                                                    <script>CKEDITOR.replace('one<?php echo hc($template['template_id']);?>');</script>
                                                </div>
                                                <input type="submit" name="one_edit" class="btn btn-default" value="Редактировать">
                                            </div>
                                        <?php }
                                    }
                                }
                            } elseif($template['template'] == 'table') {
                                foreach ($data as $val) {
                                    if($val['module_id'] == $set_modules['id']) {
                                        if($val['template_id'] == $template['template_id']) {?>
                                            <div class="tile">
                                                <div class="top"></div>
                                                <div class="center">
                                                    <div class="tile_header">
                                                        <div class="admin_edit">
                                                            <a href="/admin/data/table_edit?id=<?php echo hc($val['id']);?>&template_id=<?php echo hc($template['template_id']);?>&itemtype=<?php echo hc($template['itemscope']);?>" class="btn-default">
                                                                <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                            </a>
                                                            <input type="checkbox" name="ids[table][]" value="<?php echo hc($val['id']);?>">
                                                        </div>
                                                        <?php echo hc($val['name']);?>
                                                    </div>
                                                    <img src="<?php echo hc($val['mini']);?>" alt="<?php echo hc($val['id']);?>">
                                                    <div class="tile_content">
                                                        <p>Дата: <span> <?php echo hc($val['date']);?></span></p>
                                                        <p>Автор: <span> Dotte</span></p>
                                                    </div>
                                                    <a href="" class="button">Просмотреть</a>
                                                </div>
                                            </div>
                                        <?php }
                                    }
                                }
                            } elseif($template['template'] == 'gal') {
                                foreach ($data as $val) {
                                    if($val['module_id'] == $set_modules['id']) {
                                        if($val['template_id'] == $template['template_id']) {?>
                                            <div class="tile">
                                                <div class="top"></div>
                                                <div class="center">
                                                    <div class="tile_header">
                                                        <div class="admin_edit">
                                                            <a href="/admin/data/gal_edit?id=<?php echo hc($val['id']);?>&template_id=<?php echo hc($template['template_id']);?>&itemtype=<?php echo hc($template['itemscope']);?>" class="btn-default">
                                                                <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                            </a>
                                                            <input type="checkbox" name="ids[gal][]" value="<?php echo hc($val['id']);?>">
                                                        </div>
                                                        <?php echo hc($val['name']);?>
                                                    </div>
                                                    <img src="<?php echo hc($val['mini']);?>" alt="<?php echo hc($val['id']);?>">
                                                    <div class="tile_content">
                                                        <p>Дата: <span> <?php echo hc($val['date']);?></span></p>
                                                        <p>Автор: <span> Dotte</span></p>
                                                    </div>
                                                    <a href="" class="button">Просмотреть</a>
                                                </div>
                                            </div>
                                        <?php }
                                    }
                                }
                            } elseif($template['template'] == 'carusel') {
                                foreach ($data as $val) {
                                    if($val['module_id'] == $set_modules['id']) {
                                        if($val['template_id'] == $template['template_id']) {?>
                                            <div class="tile">
                                                <div class="top"></div>
                                                <div class="center">
                                                    <div class="tile_header">
                                                        <div class="admin_edit">
                                                            <a href="/admin/data/carusel_edit?id=<?php echo hc($val['id']);?>&template_id=<?php echo hc($template['template_id']);?>&itemtype=<?php echo hc($template['itemscope']);?>" class="btn-default">
                                                                <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                            </a>
                                                            <input type="checkbox" name="ids[carusel][]" value="<?php echo hc($val['id']);?>">
                                                        </div>
                                                        <?php echo hc($val['name']);?>
                                                    </div>
                                                    <img src="<?php echo hc($val['mini']);?>" alt="<?php echo hc($val['id']);?>">
                                                    <div class="tile_content">
                                                        <p>Дата: <span> <?php echo hc($val['date']);?></span></p>
                                                        <p>Автор: <span> Dotte</span></p>
                                                    </div>
                                                    <a href="" class="button">Просмотреть</a>
                                                </div>
                                            </div>
                                        <?php }
                                    }
                                }
                            } elseif($template['template'] == 'magazine') {
                                foreach ($data as $val) {
                                    if($val['module_id'] == $set_modules['id']) {
                                        if($val['template_id'] == $template['template_id']) {?>
                                            <div class="tile">
                                                <div class="top"></div>
                                                <div class="center">
                                                    <div class="tile_header">
                                                        <div class="admin_edit">
                                                            <a href="/admin/data/magazine_edit?id=<?php echo hc($val['id']);?>&template_id=<?php echo hc($template['template_id']);?>&itemtype=<?php echo hc($template['itemscope']);?>" class="btn-default">
                                                                <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                            </a>
                                                            <input type="checkbox" name="ids[magazine][]" value="<?php echo hc($val['id']);?>">
                                                        </div>
                                                        <?php echo hc($val['name']);?>
                                                    </div>
                                                    <img src="<?php echo hc($val['mini']);?>" alt="<?php echo hc($val['id']);?>">
                                                    <div class="tile_content">
                                                        <p>Цена: <span> <?php echo hc($val['price']);?> рубля</span></p>
                                                        <p>Дата: <span> <?php echo hc($val['date']);?></span></p>
                                                        <p>Автор: <span> Dotte</span></p>
                                                    </div>
                                                    <a href="" class="button">Просмотреть</a>
                                                </div>
                                            </div>
                                        <?php }
                                    }
                                }
                            }?>
                        </div>
                    </form>
                <?php }
            }?>
        </div>
    </div>
<?php }?>