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
            <form action="" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <div class="form_header_block">
                        <div class="left"></div>
                        <div class="center">
                            <span class="head_text">Одиночный шаблон - <?php echo hc($_GET['template_id']);?></span>
                            <input type="hidden" name="module_name" value="<?php echo hc($_GET['module_name']);?>">
                        </div>
                        <div class="right"></div>
                    </div>
                    <div id="create_tempalte"></div>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1" class="hint">Текст</label>
                    <textarea id="text" name="text" class="form-control"><?php echo hc($set_data['text'],'on');?></textarea>
                    <script>CKEDITOR.replace('text');</script>
                </div>
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