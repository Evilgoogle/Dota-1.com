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
            if(isset($error['count'])) {?>
                <div class="error_info" role="alert">
                    <div class="pic_err"></div>
                    <div class="text_err"><?php echo hc($error['count']);?></div>
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
                            <span class="head_text">Карусельный шаблон - <?php echo hc($_GET['template_id']);?></span>
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
                    <label for="exampleInputEmail1" class="hint">Текст</label>
                    <textarea id="text" name="text" class="form-control"><?php echo @hc($_POST['text'],'on');?></textarea>
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
                    <label for="exampleInputPassword1" class="hint">Полная Картина</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                            </div>
                        </div>
                        <!-->
                        <div class="form-control">
                            <button type="button" class="btn btn-default" onclick="crop_open('carusel','preview','Полная');">Выбрать</button>
                        </div>
                        <!-->
                        <div class="input-group-btn">
                            <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это картина для каруселя. Он отобразится слайдом в карусельном шаблоне">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="spoiler" onclick="spoiler('preview')">Показать картину</button>
                    <div id="insert_preview" class="cropend"></div>
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
                <input type="submit" name="ok" class="form_button" value="Добавить">
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