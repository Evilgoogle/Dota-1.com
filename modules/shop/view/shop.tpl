<div class="main_header">
    <div class="header_left">
        <!--mobile-->
        <div class="m_left"></div>
        <div class="m_center"></div>
        <div class="m_right"></div>
    </div>
    <div class="header_center">
        <span>Моя корзина</span>
    </div>
    <div class="header_right">
        <!--mobile-->
        <div class="m_left"></div>
        <div class="m_center"></div>
        <div class="m_right"></div>
    </div>
</div>
<form action="/shop/ordering" method="post">
    <?php if(count($order)) {
        //preparation
        $nums = 0;
        foreach($order as $order_val) {
            //gal
            foreach ($set_gal as $gal_key => $gal) {
                if ($gal_key == $order_val['id']) {
                    foreach ($gal as $gal_val) {
                        $gal_arr[] = $gal_val;
                    }
                }
            }
            $nums += $order_val['price'];
        }
        $gal_json = json_encode($gal_arr);
        $des_json = json_encode($order_val['des']);

        //basket
        foreach($order as $data) {
            foreach ($set_module as $module_key=>$module) {
                if($module_key == $data['module_id']) {
                    $module_name = $module['name'];
                }
            }?>
            <input data-good<?php echo hc($data['id']);?>="" type="hidden" name="order[<?php echo hc($data['id']);?>][name]" value="<?php echo hc($data['name']);?>">
            <input data-good<?php echo hc($data['id']);?>="" type="hidden" name="order[<?php echo hc($data['id']);?>][price]" value="<?php echo hc($data['price']);?>">
            <input data-good<?php echo hc($data['id']);?>="" type="hidden" name="order[<?php echo hc($data['id']);?>][artikul]" value="<?php echo hc($data['artikul']);?>">
            <div data-good<?php echo hc($data['id']);?>="" class="goods">
                <div class="left">
                    <div class="element_tree1"></div>
                    <div class="element_tree2"></div>
                    <div class="top_magazine">
                        <div class="hidden_button">
                            <button type="button" class="button" onclick="modal_magazine(<?php echo hc($data['artikul']);?>, '<?php echo hc($data['name']);?>', <?php echo hc($data['price']);?>, '<?php echo hc($des_json);?>', '<?php echo hc($gal_json,1);?>');">Быстрый <span>Просмотр</span></button>
                        </div>
                        <div class="preview_nav">
                            <div class="navigate">
                                <div class="pointer_top" onclick="nextSlide(<?php echo hc($data['id']);?>);"></div>
                                <div id="dota_mini_block<?php echo hc($data['id']);?>" class="preview_block">
                                    <ul id="dota_mini_slider<?php echo hc($data['id']);?>">
                                        <?php foreach ($set_gal as $arr_mini_key=>$arr_mini) {
                                            if($arr_mini_key == $data['id']) {
                                                foreach ($arr_mini as $img) {
                                                    $arr_mini_img[] = $img?>
                                                    <li id="mini_bn<?php echo hc($img['id']);?>" class="bn" onclick="set_review('<?php echo hc($img['id']);?>', '<?php echo hc($data['id']);?>');">
                                                        <img src="<?php echo hc($img['mini']);?>">
                                                    </li>
                                                <?php }
                                            }
                                        } $pop_mini = array_pop($arr_mini_img);?>
                                    </ul>
                                    <input type="hidden" name="order[<?php echo hc($data['id']);?>][mini]" value="<?php echo hc($pop_mini['mini']);?>">
                                </div>
                                <div class="pointer_bottom" onclick="prevSlide(<?php echo hc($data['id']);?>);"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="preview">
                            <?php foreach ($set_gal as $arr_preview_key=>$arr_preview) {
                                if($arr_preview_key == $data['id']) {
                                    foreach ($arr_preview as $preview) {?>
                                        <img <?php if(!empty($data['itemprop_pic'])) {?>itemprop="<?php echo hc($data['itemprop_pic']);?>"<?php }?> class="magazine_preview<?php echo hc($data['id']);?>" id="preview<?php echo hc($preview['id']);?>" src="<?php echo hc($preview['preview'],1);?>" alt="dota<?php echo hc($preview['id'],1);?>">
                                    <?php }
                                }
                            }?>
                        </div>
                        <script>
                            var gals = JSON.parse('<?php echo $gal_json;?>');
                            var gal_ids = [];
                            for (var gal_key in gals) {
                                if(<?php echo hc($data['artikul']);?> == gals[gal_key].data_id) {
                                    gal_ids.unshift(gals[gal_key].id);
                                }
                            }
                            $('#preview'+gal_ids[0]).css('display', 'block');
                        </script>
                    </div>
                    <div class="artikul" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Артикул"><?php echo hc($data['artikul']);?></div>
                    <button type="button" class="button_x_mobile" onclick="delete_goog(<?php echo hc($data['id'])?>);">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    </button>
                </div>
                <div class="rigth">
                    <div class="img"></div>
                    <div class="block">
                        <div class="header_block">
                            <a href="/<?php echo hc($module_name,1);?>/shop&id=<?php echo hc($data['artikul']);?>&template=<?php echo hc($data['template_id'],1);?>" class="header"><?php echo hc($data['name']);?></a>
                            <button type="button" class="button_x" onclick="delete_good(<?php echo hc($data['id'])?>, <?php echo hc($data['data_id'])?>, <?php echo hc($_SESSION['user']['id'])?>);">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </button>
                        </div>
                        <div class="props">
                            <?php if(count($set_prop)) {
                                foreach ($set_prop as $prop) {?>
                                    <div class="shop_proporties mod_modal">
                                        <div class="prop_left"></div>
                                        <div class="prop_right">8Гб</div>
                                    </div>
                                <?php }
                            } else {?>
                                <div class="text_magazine">
                                    <?php echo $data['des'];?>
                                </div>
                            <?php }?>
                        </div>
                        <div class="basket_price">
                            <div class="price">
                                <div class="left_t"></div>
                                <div class="center_t">
                                    <?php echo hc($data['price']);?><span class="currency">рб</span>
                                </div>
                                <div class="right_t"></div>
                            </div>
                            <div class="arrows_block">
                                <div class="quantity">
                                    <div class="left_t"></div>
                                    <div class="center_t">
                                        <span id="goods_quantity<?php echo hc($data['id']);?>">1</span> <span class="currency">шт</span>
                                        <input type="hidden" name="order[<?php echo hc($data['id']);?>][quantity]" value="1" id="goods_quantity_set<?php echo hc($data['id']);?>">
                                    </div>
                                    <div class="right_t"></div>
                                </div>
                                <div class="arrows">
                                    <button type="button" class="top" onclick="goods_quantity_top(<?php echo hc($data['id']);?>);"></button>
                                    <button type="button" class="bottom" onclick="goods_quantity_bottom(<?php echo hc($data['id']);?>);"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php }?>
        <div class="order_confirm">
            <?php if(isset($_SESSION['user'])) {?>
                <input type="hidden" name="sum" value="<?php echo $nums;?>">
                <div class="shop_pic_top">
                    <div class="left"></div>
                    <div class="center"></div>
                    <div class="right"></div>
                </div>
                <div class="shop_block">
                    <div class="left">
                        <div class="basket_price">
                            <div class="art"><span class="coins"></span></div>
                            <div class="price">
                                <div class="left_t"></div>
                                <div class="center_t">
                                    <?php echo $nums;?> <span class="currency">рб</span>
                                </div>
                                <div class="right_t"></div>
                            </div>
                        </div>
                    </div>
                    <div class="right">
                        <button type="submit" class="shop_basket_button"><span>Оформить заказ</span></button>
                    </div>
                </div>
            <?php } else {?>
                <div class="shop_pic_top">
                    <div class="left"></div>
                    <div class="center"></div>
                    <div class="right"></div>
                </div>
                <div class="shop_block">
                    <div class="left">
                        <div class="goods_auth">Чтобы продолжить необходимо авторизироватся - </div>
                    </div>
                    <div class="right">
                        <a href="/login?goods" class="goods_basket_button"><span>Войти</span></a>
                    </div>
                </div>
            <?php } ?>
        </div>
    <?php } else {?>
        <div class="empty">
            <div class="pic"></div>
            <div class="block">Корзина пуста</div>
    <?php }?>
</form>


