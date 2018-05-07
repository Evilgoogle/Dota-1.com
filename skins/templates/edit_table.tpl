<div class="main_header">
    <div class="header_left">
        <!--mobile-->
        <div class="m_left"></div>
        <div class="m_center"></div>
        <div class="m_right"></div>
    </div>
    <div class="header_center">
        <span>Редактировать запись</span>
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
            <?php if(isset($error['name'])) {?>
                <div class="error_info" role="alert">
                    <div class="pic_err"></div>
                    <div class="text_err"><?php echo hc($error['name']);?></div>
                </div>
            <?php }
            if(isset($error['mini'])) {?>
                <div class="error_info" role="alert">
                    <div class="pic_err"></div>
                    <div class="text_err"><?php echo hc($error['mini']);?></div>
                </div>
            <?php }
            if(isset($error['preview'])) {?>
                <div class="error_info" role="alert">
                    <div class="pic_err"></div>
                    <div class="text_err"><?php echo hc($error['preview']);?></div>
                </div>
            <?php }?>
            <form action="" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <div class="form_header_block">
                        <div class="left"></div>
                        <div class="center">
                            <span class="head_text">Табличный шаблон - <?php echo hc($_GET['template_id']);?></span>
                            <input type="hidden" name="module_name" value="<?php echo hc($_GET['module_name']);?>">
                        </div>
                        <div class="right"></div>
                    </div>
                    <div id="create_tempalte"></div>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1" class="hint">Названия</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                            </div>
                        </div>
                        <!-->
                        <input type="text" class="form-control" name="name" value="<?php echo hc($set_data['name'],'on');?>">
                        <!-->
                        <div class="input-group-btn">
                            <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Поле для редактирование название">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1" class="hint">Короткое описание</label>
                    <textarea name="des" class="form-control form_des"><?php echo hc($set_data['des'],'on');?></textarea>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1" class="hint">Текст</label>
                    <textarea id="text" name="text" class="form-control"><?php echo hc($set_data['text'],'on');?></textarea>
                    <script>CKEDITOR.replace('text');</script>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="hint">Мини Картина</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                            </div>
                        </div>
                        <!-->
                        <div class="form-control">
                            <button type="button" class="btn btn-default" onclick="crop_open('mini','mini','Мини');">Выбрать</button>
                        </div>
                        <!-->
                        <div class="input-group-btn">
                            <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это мини картина. Он отобразится в админке и в табличном шаблоне вида дота">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="spoiler" onclick="spoiler('mini')">Показать картину</button>
                    <div id="insert_mini" class="cropend"></div>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="hint">Превью Картина</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                            </div>
                        </div>
                        <!-->
                        <div class="form-control">
                            <button type="button" class="btn btn-default" onclick="crop_open('preview','preview','Превью');">Выбрать</button>
                        </div>
                        <!-->
                        <div class="input-group-btn">
                            <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это превью картина. От этой загруженной картины будет браться не обрезанная полная картина">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="spoiler" onclick="spoiler('preview')">Показать картину</button>
                    <div id="insert_preview" class="cropend"></div>
                    <input type="hidden" name="preview_mini" value="<?php echo hc($set_data['mini']);?>">
                    <input type="hidden" name="preview_preview" value="<?php echo hc($set_data['preview']);?>">
                </div>
                <script>
                    $('#insert_mini').append('<img src="<?php echo hc($set_data['mini']);?>" alt="<?php echo hc($set_data['name']);?>" class="form_pic_view">');
                    $('#insert_preview').append('<img src="<?php echo hc($set_data['preview']);?>" alt="<?php echo hc($set_data['name']);?>" class="form_pic_view">');
                </script>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="hint">Шаблоны в модулях</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
                            </div>
                        </div>
                        <select class="form-control" name="module_template">
                            <?php while($set_mt = $module_template->fetch_assoc()) {?>
                                <option <?php if($_GET['template_id'] == $set_mt['template_id']) {?>selected<?php }?>
                                        value="<?php echo hc($set_mt['module_id']);?>,<?php echo hc($set_mt['template_id']);?>">
                                    <?php
                                    $name = \MyLibs\nameTemplate::renaming($set_mt['template']);
                                    echo 'Модуль - ';
                                    echo hc($set_mt['name']);
                                    echo ' -> ';
                                    echo hc($name);
                                    echo hc($set_mt['template_id']);
                                    ?>
                                </option>
                            <?php }?>
                        </select>
                        <div class="input-group-btn">
                            <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Выбирети шаблон если хотите переместить данную запись в другой шаблон, если нет то оставляйте поле как было. Здесь появится на выбор все табличные шаблоны что есть на сайте. Шаблоны могут находится в разных модулях">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="hint">Подкатегорий</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
                            </div>
                        </div>
                        <select class="form-control" name="subcat">
                            <option value="0">Общая</option>
                            <?php while($set_subcat = $subcat->fetch_assoc()) {?>
                                <option
                                    <?php if($set_data['cat'] == $set_subcat['id']) {?>selected<?php }?>
                                    value="<?php echo hc($set_subcat['id']);?>">
                                    <?php echo hc($set_subcat['cat']);?>
                                </option>
                            <?php }?>
                        </select>
                        <div class="input-group-btn">
                            <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Выберите подкатегорию к который будет принедлежать данная запись. Если положение будет общая, то данная запись никакой подкатегорий принадлежать не будет">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1" class="hint">Itemprop</label>
                    <div class="form_header_block">
                        <div class="left"></div>
                        <div class="center">
                            <div class="left_head">itemscope itemtype - <?php echo (!empty($_GET['itemtype'])) ? $_GET['itemtype'] : 'Не определен';?></div>
                            <div class="right_head">
                                <!-- Button trigger modal -->
                                <div class="btn btn-default info" data-toggle="tooltip" data-placement="top" title="Здесь указываются свойства микроразметки. Указывайте необходимые свойства согласно данному  itemscope itemtype. Смотрите свойства в этом сайте - http://schema.org. Эти поля можно оставлять пустым. Если они пусты, то на странице itemprop не объявится">
                                    <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                </div>
                            </div>
                        </div>
                        <div class="right"></div>
                    </div>
                    <div class="form_data">
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="data_hint">Картина</label>
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <div class="btn pseudo_left">
                                        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <input type="text" name="itemprop_pic" class="form-control" value="<?php echo hc($set_data['itemprop_pic'],'on');?>">
                                <div class="input-group-btn"><div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это картина записи">
                                        <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="data_hint">Загаловок</label>
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <div class="btn pseudo_left">
                                        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <input type="text" name="itemprop_name" class="form-control" value="<?php echo hc($set_data['itemprop_name'],'on');?>">
                                <div class="input-group-btn"><div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это загаловок записи">
                                        <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="data_hint">Короткий текст</label>
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <div class="btn pseudo_left">
                                        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <input type="text" name="itemprop_des" class="form-control" value="<?php echo hc($set_data['itemprop_des'],'on');?>">
                                <div class="input-group-btn"><div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это которкий текст записи">
                                        <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="data_hint">Полный текст</label>
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <div class="btn pseudo_left">
                                        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <input type="text" name="itemprop_text" class="form-control" value="<?php echo hc($set_data['itemprop_text'],'on');?>">
                                <div class="input-group-btn"><div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это полный текст записи выводимый когда пользователь просмотривает запись">
                                        <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="data_hint">Дата </label>
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <div class="btn pseudo_left">
                                        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <input type="text" name="itemprop_date" class="form-control" value="<?php echo hc($set_data['itemprop_date'],'on');?>">
                                <div class="input-group-btn"><div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это дата добавление или редактирование записи">
                                        <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="data_hint">Кол-во просмотров</label>
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <div class="btn pseudo_left">
                                        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <input type="text" name="itemprop_views" class="form-control" value="<?php echo hc($set_data['itemprop_views'],'on');?>">
                                <div class="input-group-btn"><div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это количество просмотров данной записи. На странице он указывается цифрой">
                                        <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="data_hint">Ссылка</label>
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <div class="btn pseudo_left">
                                        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <input type="text" name="itemprop_url" class="form-control" value="<?php echo hc($set_data['itemprop_url'],'on');?>">
                                <div class="input-group-btn"><div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это ссылка на полный текст данной записи. Это кнопка - подробнее">
                                        <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="submit" name="ok" class="form_button" value="Редактировать">
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