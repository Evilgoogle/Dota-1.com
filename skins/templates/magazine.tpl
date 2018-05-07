<?php foreach($rows as $module_name=>$arr) {
	foreach($arr as $module_id=>$arr_bn) {
		foreach($arr_bn as $template_id=>$row) {?>
            <<?php echo hc($container[$template_id]['container']);?>>
                <div class="main_header">
                    <div class="header_left">
                        <!--mobile-->
                        <div class="m_left"></div>
                        <div class="m_center"></div>
                        <div class="m_right"></div>
                    </div>
                    <<?php echo hc($container[$template_id]['tegh']);?> class="header_center">
                        <span><?php echo hc($container[$template_id]['header']);?></span>
                    </<?php echo hc($container[$template_id]['tegh']);?>>
                    <div class="header_right">
                        <!--mobile-->
                        <div class="m_left"></div>
                        <div class="m_center"></div>
                        <div class="m_right"></div>
                    </div>
                </div>
                <form action="" method="post">
                    <div class="table_menu">
                        <div class="left">
                            <?php $data_json = json_encode($row);
                            if(count($gallery[$template_id])) {
                                $gal_json = json_encode($gallery[$template_id]);
                            } else {
                                $gal_json = '';
                            }
                            if(isset($_SESSION['user'])) {
                                $user_id = $_SESSION['user']['id'];
                            } else {
                                $user_id = $_SERVER['REMOTE_ADDR'].'nosession';
                            }
                            if(isset($_SESSION['user'])) {
                                if ($_SESSION['user']['role'] == 'moderator') {
                                    $role = 'moderator';
                                } elseif($_SESSION['user']['role'] == 'supermoderator') {
                                    $role = 'supermoderator';
                                } elseif ($_SESSION['user']['role'] == 'admin') {
                                    $role = 'admin';
                                } elseif($_SESSION['user']['role'] == 'user') {
                                    $role = 'user';
                                }
                            } else {
                                $role = 'user';
                            }?>
                            <div class="btn-group" role="group" aria-label="...">
                                <button id="button_magazine_list<?php echo hc($template_id,1);?>" type="button" class="btn btn-default" onclick="view_system('list_magazine',<?php echo hc($data_json);?>, <?php echo hc($module_id,1);?>, '<?php echo hc($module_name,1);?>', <?php echo hc($template_id,1);?> , <?php echo hc($gal_json,1);?>, '<?php echo hc($role)?>')">
                                    <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                                </button>
                                <button id="button_magazine_cells<?php echo hc($template_id,1);?>" type="button" class="btn btn-default" onclick="view_system('cells_magazine',<?php echo hc($data_json);?>, <?php echo hc($module_id,1);?>, '<?php echo hc($module_name,1);?>', <?php echo hc($template_id,1);?>, <?php echo hc($gal_json,1);?>, '<?php echo hc($role)?>');">
                                    <span class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                        <div class="right">
                            <div class="block">
                                <?php if(isset($_SESSION['user'])) {
                                    if($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                        <a class="btn btn-default" href="/<?php echo hc($module_name,1);?>/add?module_name=<?php echo hc($module_name,1);?>&module_id=<?php echo hc($module_id,1);?>&template_id=<?php echo hc($template_id,1);?>&template=magazine" data-toggle="tooltip" data-placement="bottom" title="Добавить запись">
                                            <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
                                        </a>
                                    <?php }
                                    if($_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                        <input type="submit" name="del[magazine][<?php echo hc($module_name,1);?>]" value="Del" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Удалить запись">
                                    <?php }
                                }?>
                            </div>
                        </div>
                    </div>
                    <!-- Блок -->
                    <?php if(count($row)) {?>
                        <!--js view-->
                        <div id="magazine_create<?php echo hc($template_id,1);?>"></div>
                        <!--default view-->
                        <div id="magazine_default<?php echo hc($template_id,1);?>">
                            <?php if($container[$template_id]['view'] == 'list') {?>
                                <div class="table_list" <?php if(!empty($container[$template_id]['itemscope'])) {?>itemscope itemtype="<?php echo hc($container[$template_id]['itemscope']);?>"<?php }?>>
                                    <?php foreach ($row as $data) {
                                    $des_json = json_encode($data['des']);
                                        if(isset($_SESSION['user'])) {
                                            if($_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                                <input type="checkbox" name="ids[]" value="<?php echo hc($data['id']);?>">
                                             <?php }
                                             if($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                                <a href="/<?php echo hc($module_name,1);?>/edit?module_name=<?php echo hc($module_name,1);?>&id=<?php echo hc($data['id']);?>&module_id=<?php echo hc($module_id,1);?>&template_id=<?php echo hc($template_id,1);?>&template=magazine" class="btn btn-primary"><span class="glyphicon glyphicon-edit" aria-hidden="true"></a>
                                            <?php }
                                        }?>
                                        <div class="table_block_list">
                                            <div class="temp_table list_skin_tmp">
                                                <div class="tree1"></div>
                                                <div class="tree2"></div>
                                                <div class="img"></div>
                                                <div class="death_knight"></div>
                                                <a <?php if(!empty($data['itemprop_url'])) {?>itemprop="<?php echo hc($data['itemprop_url']);?>"<?php }?> href="/<?php echo hc($module_name,1);?>/shop?id=<?php echo hc($data['id']);?>&template=<?php echo hc($template_id,1);?>" class="magazine_button"><span>Подробнее</span></a>
                                                <div class="block">
                                                    <div class="left_magazine">
                                                        <div class="top_magazine">
                                                            <div class="hidden_button">
                                                                <button type="button" class="button" onclick="modal_magazine(<?php echo hc($data['id']);?>, '<?php echo hc($data['name']);?>', <?php echo hc($data['price']);?>, '<?php echo hc($des_json);?>', '<?php echo hc($gal_json,1);?>', '<?php echo hc($user_id,1);?>');">Быстрый <span>Просмотр</span></button>
                                                            </div>
                                                            <div class="preview_nav">
                                                                <div class="navigate">
                                                                    <div class="pointer_top" onclick="nextSlide(<?php echo hc($data['id']);?>);"></div>
                                                                    <div id="dota_mini_block<?php echo hc($data['id']);?>" class="preview_block">
                                                                        <ul id="dota_mini_slider<?php echo hc($data['id']);?>">
                                                                            <?php foreach ($gallery[$template_id] as $img) {
                                                                                if($img['data_id'] == $data['id']) {?>
                                                                                    <li id="mini_bn<?php echo hc($img['id']);?>" class="bn" onclick="set_review('<?php echo hc($img['id']);?>', '<?php echo hc($data['id']);?>');">
                                                                                        <img src="<?php echo hc($img['mini']);?>">
                                                                                    </li>
                                                                                <?php }
                                                                            }?>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="pointer_bottom" onclick="prevSlide(<?php echo hc($data['id']);?>);"></div>
                                                                </div>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                            <div class="preview">
                                                                <?php foreach ($gallery[$template_id] as $img) {
                                                                    if($img['data_id'] == $data['id']) {?>
                                                                        <img <?php if(!empty($data['itemprop_pic'])) {?>itemprop="<?php echo hc($data['itemprop_pic']);?>"<?php }?> class="magazine_preview<?php echo hc($data['id']);?>" id="preview<?php echo hc($img['id']);?>" src="<?php echo hc($img['preview'],1);?>" alt="dota<?php echo hc($img['id'],1);?>">
                                                                    <?php }
                                                                }?>
                                                            </div>
                                                            <script>
                                                                var gals = JSON.parse('<?php echo $gal_json;?>');
                                                                var gal_ids = [];
                                                                for (var gal_key in gals) {
                                                                    if(<?php echo hc($data['id']);?> == gals[gal_key].data_id) {
                                                                        gal_ids.unshift(gals[gal_key].id);
                                                                    }
                                                                }
                                                                $('#preview'+gal_ids[0]).css('display', 'block');
                                                            </script>
                                                        </div>
                                                        <div class="art1226" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Артикул"><?php echo hc($data['id']);?></div>
                                                    </div>
                                                    <div class="rigth">
                                                        <a <?php if(!empty($data['itemprop_name'])) {?>itemprop="<?php echo hc($data['itemprop_name']);?>"<?php }?> class="header" href="/<?php echo hc($module_name,1);?>/shop?id=<?php echo hc($data['id']);?>&template=<?php echo hc($template_id,1);?>"><?php echo hc($data['name'],1);?></a>
                                                        <div <?php if(!empty($data['itemprop_des'])) {?>itemprop="<?php echo hc($data['itemprop_des']);?>"<?php }?> class="magazine_text"><?php echo $data['des'];?></div>
                                                        <div class="magazine_block">
                                                            <div class="top_pic">
                                                                <div class="pic_left"></div>
                                                                <div class="pic_center"></div>
                                                                <div class="pic_right"></div>
                                                            </div>
                                                            <div class="basket_price">
                                                                <div class="magazine_art" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Артикул"><?php echo hc($data['id']);?></div>
                                                                <div class="price">
                                                                    <div class="left_t"></div>
                                                                    <div <?php if(!empty($data['itemprop_url'])) {?>itemprop="<?php echo hc($data['itemprop_price']);?>"<?php }?> class="center_t">
                                                                        <?php echo hc($data['price'],1);?>
                                                                        <span class="currency">рб</span>
                                                                    </div>
                                                                    <div class="right_t"></div>
                                                                </div>
                                                                <button type="button" class="basket" onclick="add_buy(<?php echo hc($data['id'])?>, '<?php echo hc($user_id)?>')"></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php }?>
                                </div>
                            <?php } elseif($container[$template_id]['view'] == 'cells') {?>
                                <div class="table_cells" <?php if(!empty($container[$template_id]['itemscope'])) {?>itemscope itemtype="<?php echo hc($container[$template_id]['itemscope']);?>"<?php }?>>
                                    <?php foreach($row as $data) {
                                        $des_json = json_encode($data['des']);?>
                                        <div class="table_block_cells">
                                            <?php if(isset($_SESSION['user'])) {
                                                if($_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                                    <input type="checkbox" name="ids[]" value="<?php echo hc($data['id']);?>">
                                                <?php }
                                                if($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                                    <a href="/<?php echo hc($module_name,1);?>/edit?module_name=<?php echo hc($module_name,1);?>&id=<?php echo hc($data['id']);?>&module_id=<?php echo hc($module_id,1);?>&template_id=<?php echo hc($template_id,1);?>&template=magazine" class="btn btn-primary"><span class="glyphicon glyphicon-edit" aria-hidden="true"></a>
                                                <?php }
                                            }?>
                                            <div class="temp_magazine">
                                                <div class="tree1"></div>
                                                <div class="tree2_magazine"></div>
                                                <div class="tree3_magazine"></div>
                                                <div class="magazine_img"></div>
                                                <div class="img mod"></div>
                                                <div class="death_knight"></div>
                                                <div class="block">
                                                    <div class="art">Артикул: <span><?php echo hc($data['id']);?></span></div>
                                                    <div class="top_magazine">
                                                        <div class="hidden_button">
                                                            <button type="button" onclick="modal_magazine(<?php echo hc($data['id']);?>, '<?php echo hc($data['name']);?>', <?php echo hc($data['price']);?>, '<?php echo hc($des_json);?>', '<?php echo hc($gal_json,1);?>', '<?php echo hc($user_id,1);?>');" class="button">Быстрый <span>Просмотр</span></button>
                                                        </div>
                                                        <div class="preview_nav">
                                                            <div class="navigate">
                                                                <div class="pointer_top" onclick="nextSlide(<?php echo hc($data['id']);?>);"></div>
                                                                <div id="dota_mini_block<?php echo hc($data['id']);?>" class="preview_block">
                                                                    <ul id="dota_mini_slider<?php echo hc($data['id']);?>">
                                                                        <?php foreach ($gallery[$template_id] as $img) {
                                                                            if($img['data_id'] == $data['id']) {?>
                                                                                <li id="mini_bn<?php echo hc($img['id']);?>" class="bn" onclick="set_review('<?php echo hc($img['id']);?>', '<?php echo hc($data['id']);?>');">
                                                                                    <img src="<?php echo hc($img['mini']);?>">
                                                                                </li>
                                                                            <?php }
                                                                        }?>
                                                                    </ul>
                                                                </div>
                                                                <div class="pointer_bottom" onclick="prevSlide(<?php echo hc($data['id']);?>);"></div>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="preview">
                                                            <?php foreach ($gallery[$template_id] as $img) {
                                                                if($img['data_id'] == $data['id']) {?>
                                                                    <img <?php if(!empty($data['itemprop_pic'])) {?>itemprop="<?php echo hc($data['itemprop_pic']);?>"<?php }?> class="magazine_preview<?php echo hc($data['id']);?>" id="preview<?php echo hc($img['id']);?>" src="<?php echo hc($img['preview'],1);?>" alt="dota<?php echo hc($img['id'],1);?>">
                                                                <?php }
                                                            }?>
                                                        </div>
                                                        <script>
                                                            var gals = JSON.parse('<?php echo $gal_json;?>');
                                                            var gal_ids = [];
                                                            for (var gal_key in gals) {
                                                                if(<?php echo hc($data['id']);?> == gals[gal_key].data_id) {
                                                                    gal_ids.unshift(gals[gal_key].id);
                                                                }
                                                            }
                                                            $('#preview'+gal_ids[0]).css('display', 'block');
                                                        </script>
                                                    </div>
                                                    <div class="bottom">
                                                        <a <?php if(!empty($data['itemprop_name'])) {?>itemprop="<?php echo hc($data['itemprop_name']);?>"<?php }?> class="header" href="/<?php echo hc($module_name,1);?>/shop?id=<?php echo hc($data['id']);?>&template=<?php echo hc($template_id,1);?>"><?php echo hc($data['name'],1);?></a>
                                                        <div class="top_pic">
                                                            <div class="pic_left"></div>
                                                            <div class="pic_center"></div>
                                                            <div class="pic_right"></div>
                                                        </div>
                                                        <div <?php if(!empty($data['itemprop_des'])) {?>itemprop="<?php echo hc($data['itemprop_des']);?>"<?php }?> class="text_magazine">
                                                            <?php echo $data['des'];?>
                                                        </div>
                                                        <div class="bottom_pic"></div>
                                                        <div class="magazine_block"></div>
                                                        <div class="basket_price">
                                                            <div class="price">
                                                                <div class="left_t"></div>
                                                                <div class="center_t" <?php if(!empty($data['itemprop_url'])) {?>itemprop="<?php echo hc($data['itemprop_price']);?>"<?php }?>>
                                                                    <?php echo hc($data['price'],1);?>
                                                                    <span class="currency">рб</span>
                                                                </div>
                                                                <div class="right_t"></div>
                                                            </div>
                                                            <button type="button" class="basket" onclick="add_buy(<?php echo hc($data['id'])?>, '<?php echo hc($user_id)?>')"></button>
                                                        </div>
                                                        <a <?php if(!empty($data['itemprop_url'])) {?>itemprop="<?php echo hc($data['itemprop_url']);?>"<?php }?> href="/<?php echo hc($module_name,1);?>/shop?id=<?php echo hc($data['id']);?>&template=<?php echo hc($template_id,1);?>" class="magazine_button">
                                                            <span>Подробнее</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php }?>
                                </div>
                            <?php } ?>
                        </div>
                        <script>
                            create_magazine_panel('<?php echo hc($template_id,1);?>','<?php echo hc($container[$template_id]['header']);?>', <?php echo hc($module_id,1);?>, '<?php echo hc($module_name);?>', '<?php echo $gal_json;?>');
                        </script>
                    <?php } else {?>
                        <p>Записи пока нет</p>
                    <?php }?>
                </form>
            </<?php echo hc($container[$template_id]['container']);?>>
		<?php }
	}
}?>