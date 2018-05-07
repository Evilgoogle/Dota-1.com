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
            <?php if(isset($error['name'])) {?>
                <div class="error_info" role="alert">
                    <div class="pic_err"></div>
                    <div class="text_err"><?php echo hc($error['name']);?></div>
                </div>
            <?php }
            if(isset($error['price'])) {?>
                <div class="error_info" role="alert">
                    <div class="pic_err"></div>
                    <div class="text_err"><?php echo hc($error['price']);?></div>
                </div>
            <?php }
            if(isset($error['mini'])) {?>
                <div class="error_info" role="alert">
                    <div class="pic_err"></div>
                    <div class="text_err"><?php echo hc($error['mini']);?></div>
                </div>
            <?php }
            if(isset($error['pic'])) {?>
                <div class="error_info" role="alert">
                    <div class="pic_err"></div>
                    <div class="text_err"><?php echo hc($error['pic']);?></div>
                </div>
            <?php }
            if(isset($error['pics'])) {
                foreach ($error['pics'] as $key_info=>$pics) {
                    foreach ($pics as $info) {
                        if ($key_info == 'pics_mini') { ?>
                            <div class="error_info" role="alert">
                                <div class="pic_err"></div>
                                <div class="text_err"><?php echo hc($info);?></div>
                            </div>
                        <?php } elseif ($key_info == 'pics_preview') {?>
                            <div class="error_info" role="alert">
                                <div class="pic_err"></div>
                                <div class="text_err"><?php echo hc($info);?></div>
                            </div>
                        <?php }
                    }
                }
            } ?>
            <form action="" method="post" enctype="multipart/form-data" id="form_ok">
                <div class="form-group">
                    <div class="form_header_block">
                        <div class="left"></div>
                        <div class="center">
                            <span class="head_text">Магазинный шаблон - <?php echo hc($_GET['template_id']);?></span>
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
                        <input type="text" class="form-control" name="name" value="<?php echo @hc($_POST['name'],'on');?>">
                        <!-->
                        <div class="input-group-btn">
                            <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Введите название">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1" class="hint">Короткое описание</label>
                    <textarea id="des" name="des" class="form-control"><?php echo @hc($_POST['des'],'on');?></textarea>
                    <script>CKEDITOR.replace('des');</script>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1" class="hint">Текст</label>
                    <textarea id="full" name="text" class="form-control"><?php echo @hc($_POST['text'],'on');?></textarea>
                    <script>CKEDITOR.replace('full');</script>
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
                            <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это мини картина. Он отобразится в админке и в табличном шаблоне в виде дота">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="spoiler" onclick="spoiler('mini')">Показать картину</button>
                    <div id="insert_mini" class="cropend"></div>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="hint">Картины товара</label>
                    <div class="magazine_pics">
                        <div class="header">
                            <div class="left">
                                <button class="btn btn-default" type="button" onclick="magazine_pics()">Добавить</button>
                            </div>
                            <div class="right">
                                <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Здесь добавляются картины товара. Этим вы можете показать товар с разных ракурсов. Выберайте большые картины чтоб пользователь мог нормально оценить данный товар">
                                    <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                </div>
                            </div>
                        </div>
                        <div id="magazine_pics" class="block"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="hint">Свойства</label>
                    <div class="form_data">
                        <div class="prop_header">
                            <div class="left">Подкатегорий и свойства</div>
                            <div class="right">
                                <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Определите свойства данному товару. По данным свойствам пользователь может легко найти товар через навигацию магазина. Если никакая из свойств не выбрано, то данной товар будет появляется при загрузке страницы когда не были выбраны свойства из навигаций свойств данного магазина">
                                    <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                </div>
                            </div>
                        </div>
                        <div class="propertie">
                            <?php foreach ($subcat as $cat) {?>
                                <div class="block">
                                    <div class="header"><?php echo hc($cat['cat']);?></div>
                                    <?php foreach ($properties as $prop) {
                                        if($cat['id'] == $prop['cat_id']) {?>
                                            <div class="prop">
                                                <input type="checkbox" name="properties[<?php echo hc($cat['id'])?>][<?php echo hc($prop['properties'])?>][]" value="<?php echo hc($prop['id']);?>">
                                                <p class="text_properties"><?php echo hc($prop['properties']);?></p>
                                            </div>
                                        <?php }
                                    }?>
                                </div>
                            <?php }?>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1" class="hint">Цена</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                            </div>
                        </div>
                        <!-->
                        <input type="text" class="form-control" name="price" value="<?php echo @hc($_POST['price'],'on');?>">
                        <!-->
                        <div class="input-group-btn">
                            <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Укажите цену товара">
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
                                <input type="text" name="itemprop_pic" class="form-control" value="<?php echo @hc($_POST['itemprop_pic'],'on');?>">
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
                                <input type="text" name="itemprop_name" class="form-control" value="<?php echo @hc($_POST['itemprop_name'],'on');?>">
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
                                <input type="text" name="itemprop_des" class="form-control" value="<?php echo @hc($_POST['itemprop_des'],'on');?>">
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
                                <input type="text" name="itemprop_text" class="form-control" value="<?php echo @hc($_POST['itemprop_text'],'on');?>">
                                <div class="input-group-btn"><div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это полный текст записи выводимый когда пользователь просмотривает запись">
                                        <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="data_hint">Цена</label>
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <div class="btn pseudo_left">
                                        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <input type="text" name="itemprop_price" class="form-control" value="<?php echo @hc($_POST['itemprop_price'],'on');?>">
                                <div class="input-group-btn"><div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это цена товара">
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
                                <input type="text" name="itemprop_url" class="form-control" value="<?php echo @hc($_POST['itemprop_url'],'on');?>">
                                <div class="input-group-btn"><div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это ссылка на полный текст данной записи. Это кнопка - подробнее">
                                        <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="submit" name="ok" class="form_button" value="Добавить" >
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