<form action="" method="post" onsubmit="return isValidForm_registration('edit')">
    <div class="auth_reg">
        <div class="row">
            <div class="col-lg-12">
                <div class="form_top_block">
                    <div class="form_top_pic"></div>
                    <div class="form_block_pic">
                        <div class="left"></div>
                        <div class="center user_edit"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="form_center form_center_users">
                    <div class="auth_fon_bottom"></div>
                    <?php if(isset($error['login'])) {?>
                        <div class="alert alert-danger" role="alert"><?php echo hc($error['login']);?></div>
                    <?php }
                    if(isset($error['pass'])) {?>
                        <div class="alert alert-danger" role="alert"><?php echo hc($error['pass']);?></div>
                    <?php }
                    if(isset($error['email'])) {?>
                        <div class="alert alert-danger" role="alert"><?php echo hc($error['email']);?></div>
                    <?php }
                    if(isset($error['name'])) {?>
                        <div class="alert alert-danger" role="alert"><?php echo hc($error['name']);?></div>
                    <?php } if(isset($error['preview'])) {?>
                        <div class="alert alert-danger" role="alert"><?php echo hc($error['preview']);?></div>
                    <?php }?>
                    <div class="auth_block">
                        <div class="hero_left"></div>
                        <div class="center_block center_block_reg">
                            <div class="form_header_block">
                                <div class="left"></div>
                                <div class="center center_header_reg">
                                    <span class="head_text">Настроика пользователя - <?php echo hc($set['login']);?></span>
                                    <input type="hidden" name="module_name" value="good">
                                </div>
                                <div class="right"></div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="hint">Логин</label>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <div id="err_login" class="btn pseudo_left">
                                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <!---->
                                    <input id="data_login" type="text" class="form-control" name="login" placeholder="Логин" value="<?php echo hc($set['login']);?>">
                                    <!---->
                                    <div class="input-group-btn">
                                        <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Это логин пользователя. Вы его можете поменять по просьбе пользователя">
                                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="hint">Пароль</label>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <div id="err_pass" class="btn pseudo_left">
                                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <!---->
                                    <input id="data_pass" type="password" class="form-control" name="pass" placeholder="Пароль">
                                    <!---->
                                    <div class="input-group-btn">
                                        <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Введите пароль. Минимальная длина 4 символа">
                                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="hint">Повторите пароль</label>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <div id="err_pass_ex" class="btn pseudo_left">
                                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <!---->
                                    <input id="data_pass_ex" type="password" class="form-control" name="pass_ex">
                                    <!---->
                                    <div class="input-group-btn">
                                        <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Введите пароль еще раз">
                                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form_line"></div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="hint">Имя</label>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <div id="err_name" class="btn pseudo_left">
                                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <!---->
                                    <input id="data_name" type="text" class="form-control" name="name" placeholder="Алексей" value="<?php echo hc($set['name'],'on');?>">
                                    <!---->
                                    <div class="input-group-btn">
                                        <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Введите свое имя. Имя может содержать только латинские и русские буквы, символы '-' '_', цифры и пробел">
                                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="hint">Почта</label>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <div id="err_email" class="btn pseudo_left">
                                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <!---->
                                    <input id="data_email" type="text" class="form-control" name="email" placeholder="dota@gmail.com" value="<?php echo hc($set['email'],'on');?>">
                                    <!---->
                                    <div class="input-group-btn">
                                        <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Введите свою почту. Туда будет отправлена ссылка для активаций аккаунта">
                                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="hint">Skype</label>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <div class="btn pseudo_left">
                                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <!---->
                                    <input type="text" class="form-control" name="skype" placeholder="dotte" value="<?php echo hc($set['skype'],'on');?>">
                                    <!---->
                                    <div class="input-group-btn">
                                        <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Введите свои Skype. Это поле не обезателен для заполнение. Можно оставить пустым">
                                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="hint">Картина</label>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <div class="btn pseudo_left">
                                            <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <!-->
                                    <div class="form-control">
                                        <button type="button" class="btn btn-default" onclick="crop_open('avatar','preview','Аватарной');">Выбрать</button>
                                    </div>
                                    <!-->
                                    <div class="input-group-btn">
                                        <div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это ваша аватар картина">
                                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" class="spoiler" onclick="spoiler('preview')">Показать картину</button>
                                <div id="insert_preview" class="cropend"></div>
                                <input type="hidden" name="preview_preview" value="<?php echo hc($set['img']);?>">
                            </div>
                            <script>
                                $('#insert_preview').append('<img src="<?php echo hc($set['img']);?>" alt="<?php echo hc($set['img']);?>" class="form_pic_view">');
                            </script>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="hint">О себе</label>
                                <textarea id="text" name="about" class="form-control"><?php echo hc($set['about'],'on');?></textarea>
                                <script>CKEDITOR.replace('text');</script>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="hint">Активность</label>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <div class="btn pseudo_left">
                                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <!---->
                                    <select class="form-control" name="access">
                                        <option <?php if($set['access'] == '1') {?>selected<?php }?> value="1">Активен</option>
                                        <option <?php if($set['access'] == '0') {?>selected<?php }?> value="0">Деактивен</option>
                                        <option <?php if($set['access'] == '2') {?>selected<?php }?> value="2">Забанен</option>
                                    </select>
                                    <!---->
                                    <div class="input-group-btn">
                                        <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Здесь вы можете - деактивировать, активировать или забанить пользователя">
                                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="hint">Права доступа</label>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <div class="btn pseudo_left">
                                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <!---->
                                    <select class="form-control" name="role">
                                        <option <?php if($set['role'] == 'admin') {?>selected<?php }?> value="admin">Администратор</option>
                                        <option <?php if($set['role'] == 'supermoderator') {?>selected<?php }?> value="supermoderator">Супермодератор</option>
                                        <option <?php if($set['role'] == 'moderator') {?>selected<?php }?> value="moderator">Модератор</option>
                                        <option <?php if($set['role'] == 'user') {?>selected<?php }?> value="user">Пользователь</option>
                                    </select>
                                    <!---->
                                    <div class="input-group-btn">
                                        <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Здесь вы можете - деактивировать, активировать или забанить пользователя">
                                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="is_login" value="<?php echo hc($_GET['login'])?>">
                            <input type="hidden" name="is_email" value="<?php echo hc($_GET['email'])?>">
                            <button type="submit" class="auth_button" name="ok"><span>Изменить</span></button>
                        </div>
                        <div class="hero_right"></div>
                    </div>
                </div>
                <div class="form_bottom_block">
                    <div class="form_block_pic">
                        <div class="left"></div>
                        <div class="center user_edit_bottom"></div>
                        <div class="right"></div>
                    </div>
                    <div class="form_bottom_pic"></div>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    window.onload = function () {
        $('#init_panel').empty();
    }
</script>