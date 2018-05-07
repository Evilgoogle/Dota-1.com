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
<div class="base_text"><?php echo $set['text'];?></div>