<div class="main_header">
    <div class="header_left"></div>
    <div class="header_center">
        <span>Добавить модуль</span>
    </div>
    <div class="header_right"></div>
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
                <div class="alert alert-danger" role="alert"><?php echo hc($error['name']);?></div>
            <?php }
            if(isset($error['seo_url'])) {?>
                <div class="alert alert-danger" role="alert"><?php echo hc($error['seo_url']);?></div>
            <?php }
            if(isset($error['meta_title'])) {?>
                <div class="alert alert-danger" role="alert"><?php echo hc($error['meta_title']);?></div>
            <?php }
            if(isset($error['meta_des'])) {?>
                <div class="alert alert-danger" role="alert"><?php echo hc($error['meta_des']);?></div>
            <?php }
            if(isset($error['meta_key'])) {?>
                <div class="alert alert-danger" role="alert"><?php echo hc($error['meta_key']);?></div>
            <?php }
            if(isset($error['data'])) {?>
                <div class="alert alert-danger" role="alert"><?php echo hc($error['data']);?></div>
            <?php }
            if(isset($error['parent'])) {?>
                <div class="alert alert-danger" role="alert"><?php echo hc($error['parent']);?></div>
            <?php }
            if(isset($error['module'])) {?>
                <div class="alert alert-danger" role="alert"><?php echo hc($error['module']);?></div>
            <?php }?>
            <form action="" method="post" id="form_module">
                <div class="form-group">
                    <label for="exampleInputEmail1" class="hint">Названия модуля</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                            </div>
                        </div>
                        <!-->
                        <input type="text" class="form-control" placeholder="Гайды по Dota" name="name" value="<?php echo @hc($_POST['name'],'on');?>">
                        <!-->
                        <div class="input-group-btn">
                            <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это название модуля. Он отобразится в навигациях">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="hint">SEO-Url</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                            </div>
                        </div>
                        <!-->
                        <input type="text" class="form-control" placeholder="dotaguide" name="seo_url" value="<?php echo @hc($_POST['seo_url'],'on');?>">
                        <!-->
                        <div class="input-group-btn">
                            <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это адрес страницы. С его помощью будет производится адресация на этот модуль. Также он является ключевым словом для поисковиков. Можно ввести символы только англиского языка">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="hint">Meta-Title</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                            </div>
                        </div>
                        <!-->
                        <input type="text" class="form-control" placeholder="Гайды по Dota" name="meta_title" value="<?php echo @hc($_POST['meta_title'],'on');?>">
                        <!-->
                        <div class="input-group-btn">
                            <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это мета тег загалока страницы. Он нужен поисковику">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="hint">Meta-Description</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                            </div>
                        </div>
                        <!-->
                        <input type="text" class="form-control" placeholder="Dota - это командная стратегическая игра" name="meta_des" value="<?php echo @hc($_POST['meta_des'],'on');?>">
                        <!-->
                        <div class="input-group-btn">
                            <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это мета тег короткого описание страницы. Он нужен поисковику">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="hint">Meta-Keywords</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                            </div>
                        </div>
                        <!-->
                        <input type="text" class="form-control" placeholder="Dota, Guide, Razor, Kel'Thuzad, Ursa ..." name="meta_key" value="<?php echo @hc($_POST['meta_key'],'on');?>">
                        <!-->
                        <div class="input-group-btn">
                            <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это мета тег для ключевых слов что может встречатся на этой странице. Он нужен поисковику">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="hint">Родителький модуль</label>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <div class="btn pseudo_left">
                                <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
                            </div>
                        </div>
                        <select class="form-control" name="parent">
                            <option value="0">Главная</option>
                            <?php while ($set = $row->fetch_assoc()) {?>
                                <option value="<?php echo hc($set['id']);?>"><?php echo hc($set['name']);?></option>
                            <?php }?>
                        </select>
                        <div class="input-group-btn">
                            <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Выберите родителький модуль к которому будет принедлежать данный модуль. Если позунок будет на положений ГЛАВНАЯ, то этот модуль будет считаться главным и появится в навигаций сайта. Подмодули также будут появлятся в навигациях, но при выборе их родителького модуля. Главные модули не могут привышать 10шт">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form_header">
                        <div class="left">Шаблоны</div>
                        <div class="right">
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#template">
                                Добавить
                            </button>
                            <!-- Button trigger modal -->
                            <div class="btn btn-default info" data-toggle="tooltip" data-placement="top" title="Добавляет шаблон на этот модуль. Шаблоны представляют информацию на странице. Модули не могут быть пустымы, должно быть хотя бы 1 шаблон. В кратце, модуль можно создать с одним видом шаблона или несколькими шаблонами">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                    <div id="create_tempalte"></div>
                    <?php if(isset($_POST['data'])) {
                        foreach ($_POST['data'] as $val) {
                            foreach ($val as $k => $v) {?>
                                <script>create_template('<?php echo hc($k,1);?>');</script>
                            <?php }
                        }
                    }?>
                </div>
                <input type="submit" name="ok" class="btn btn-default" value="Добавить">
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
