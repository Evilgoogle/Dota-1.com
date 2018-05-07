<form action="" method="post" onsubmit="return isValidForm_registration('add')">
    <div class="auth_reg">
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
                <div class="form_center form_center_users">
                    <div class="auth_fon_bottom"></div>
                    <?php if(isset($error['login'])) {?>
                        <div class="error_info" role="alert">
                            <div class="pic_err"></div>
                            <div class="text_err"><?php echo hc($error['login'],1);?></div>
                        </div>
                    <?php }
                    if(isset($error['pass'])) {?>
                        <div class="error_info" role="alert">
                            <div class="pic_err"></div>
                            <div class="text_err"><?php echo hc($error['pass']);?></div>
                        </div>
                    <?php }
                    if(isset($error['email'])) {?>
                        <div class="error_info" role="alert">
                            <div class="pic_err"></div>
                            <div class="text_err"><?php echo hc($error['email']);?></div>
                        </div>
                    <?php }
                    if(isset($error['name'])) {?>
                        <div class="error_info" role="alert">
                            <div class="pic_err"></div>
                            <div class="text_err"><?php echo hc($error['name']);?></div>
                        </div>
                    <?php }?>
                    <div class="auth_block">
                        <div class="hero_left"></div>
                        <div class="center_block center_block_reg">
                            <div class="form_header_block">
                                <div class="left"></div>
                                <div class="center center_header_reg">
                                    <span class="head_text">Регистрация</span>
                                    <input type="hidden" name="module_name" value="good">
                                </div>
                                <div class="right"></div>
                                <!--mobile-->
                                <div class="modile_top mobile_header_reg">
                                    <div class="m_left"></div>
                                    <div class="m_center mob_header_center"></div>
                                    <div class="m_right"></div>
                                </div>
                                <div class="mobile_center">
                                    <span>Регистрация</span>
                                </div>
                                <div class="mobile_bottom mobile_header_reg">
                                    <div class="m_left"></div>
                                    <div class="m_center mob_header_center"></div>
                                    <div class="m_right"></div>
                                </div>
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
                                    <input id="data_login" type="text" class="form-control" name="login" placeholder="Логин" value="<?php echo @hc($_POST['login'],'on');?>">
                                    <!---->
                                    <div class="input-group-btn">
                                        <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Придумайте себе логин. Этим логином вы будите заходить на сайт. Логин может содержать только латинские буквы, символы '-' '_' и цифры">
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
                                    <input id="data_name" type="text" class="form-control" name="name" placeholder="Алексей" value="<?php echo @hc($_POST['name'],'on');?>">
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
                                    <input id="data_email" type="text" class="form-control" name="email" placeholder="dota@gmail.com" value="<?php echo @hc($_POST['email'],'on');?>">
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
                                    <input type="text" class="form-control" name="skype" placeholder="dotte" value="<?php echo @hc($_POST['skype'],'on');?>">
                                    <!---->
                                    <div class="input-group-btn">
                                        <div class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Введите свои Skype. Это поле не обезателен для заполнение. Можно оставить пустым">
                                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="hint">О себе</label>
                                <textarea id="text" name="about" class="form-control"><?php echo @hc($_POST['about'],'on');?></textarea>
                                <script>CKEDITOR.replace('text');</script>
                            </div>
                            <button type="submit" class="auth_button" name="ok"><span>Создать</span></button>
                        </div>
                        <div class="hero_right"></div>
                    </div>
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
    </div>
</form>

<script>
    window.onload = function () {
        $('#init_panel').empty();
    }
</script>