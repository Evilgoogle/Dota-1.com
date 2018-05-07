<?php
Core::$META = [
    'title'=>''.$set['name'].'',
    'description'=>''.$set['name'].'',
    'keywords'=>''.$set['name'].'',

    'canonical' => '',
    'shortlink' => '',
    'prev' => '',
    'next' => '',
    'dns-prefetch' => [],
    'head' => '',
];
?>
<div class="main_header">
    <div class="header_left">
        <!--mobile-->
        <div class="m_left"></div>
        <div class="m_center"></div>
        <div class="m_right"></div>
    </div>
    <h1 class="header_center">
        <span><?php echo hc($set['name']);?></span>
    </h1>
    <div class="header_right">
        <!--mobile-->
        <div class="m_left"></div>
        <div class="m_center"></div>
        <div class="m_right"></div>
    </div>
</div>

<div class="shop_infoSlide">Картина увеличится если нажать на него. Нажмите и удерживайте мышку</div>
<div class="shopSlider_img">
    <?php foreach($gal as $img) {?>
        <span class="jQueryZoomer"><img src="<?php echo hc($img['img']);?>" alt="<?php echo hc($img['id']);?>"></span>
    <?php }?>
</div>
<div class="shopSlider_navigate">
    <?php foreach($gal as $mini) {?>
        <img src="<?php echo hc($mini['mini']);?>" alt="<?php echo hc($mini['id']);?>">
    <?php }?>
</div>

<script>
    //Slick
    $(document).ready(function(){
        $('.shopSlider_img').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,
            asNavFor: '.shopSlider_navigate',
            adaptiveHeight: true,
            draggable: false
        });
        $('.shopSlider_navigate').slick({
            slidesToShow: 2,
            slidesToScroll: 1,
            asNavFor: '.shopSlider_img',
            dots: true,
            centerMode: true,
            focusOnSelect: true,
            prevArrow: '<button type="button" class="dota_prev">',
            nextArrow: '<button type="button" class="dota_next">'
        });
    });
    //Zoomer
    $(document).ready(function(){
        $('.jQueryZoomer').zoom({ on:'grab' });
    });
</script>

<div class="shop_pic_top">
    <div class="left"></div>
    <div class="center"></div>
    <div class="right"></div>
</div>
<div class="shop_block">
    <div class="left">
        <div class="basket_price">
            <div class="art"><span><?php echo hc($set['id']);?></span></div>
            <div class="price">
                <div class="left_t"></div>
                <div class="center_t">
                    <?php echo hc($set['price']);?>
                    <span class="currency">рб</span>
                </div>
                <div class="right_t"></div>
            </div>
        </div>
    </div>
    <div class="right">
        <button type="button" class="shop_basket_button" onclick="add_buy(<?php echo hc($set['id'])?>, '<?php echo hc(isset($_SESSION['user']) ? $_SESSION['user']['id'] : $_SERVER['REMOTE_ADDR'].'nosession')?>')"><span>В Корзину</span></button>
    </div>
</div>
<div class="shop_text"><?php echo $set['text'];?></div>
<script>
    window.onload = function () {
        shop_prop(<?php echo hc($_GET['id']);?>);
    }
</script>