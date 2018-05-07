<?php foreach($rows as $module_name=>$arr) {
	foreach($arr as $module_id=>$arr_bn) {
		foreach($arr_bn as $template_id=>$row) {?>
			<<?php echo hc($container[$template_id]['container']);?> class="slide_carusel">
            <?php if(!empty($container[$template_id]['header'])) { ?>
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
			<?php }?>

            <?php if(isset($_SESSION['user'])) {?>
            <div class="table_menu">
                <div class="right">
                    <?php if($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                        <a class="btn btn-default" href="/<?php echo hc($module_name,1);?>/add?module_name=<?php echo hc($module_name,1);?>&module_id=<?php echo hc($module_id,1);?>&template_id=<?php echo hc($template_id,1);?>&template=carusel" data-toggle="tooltip" data-placement="bottom" title="Добавить запись"><span class="glyphicon glyphicon-share" aria-hidden="true"></span>
                        </a>
                    <?php }?>
                </div>
            </div>
            <?php }?>

            <?php if(count($row)) {?>
				<div class="block" <?php if(!empty($container[$template_id]['itemscope'])) {?>itemscope itemtype="<?php echo hc($container[$template_id]['itemscope']);?>"<?php }?>>
                    <div class="carusel_block">
                        <div id="carusel_dota<?php echo hc($template_id,1)?>" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators site_carousel-indicators">
                                <?php foreach ($row as $data) {?>
                                    <div class="info" data-target="#carusel_dota<?php echo hc($template_id,1)?>" data-slide-to="<?php echo hc($data['id']);?>">
                                        <span class="glyphicon glyphicon-tint" aria-hidden="true"></span>
                                    </div>
                                <?php }?>
                            </ol>
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <?php foreach ($row as $data) {?>
                                    <div id="carusel_item<?php echo hc($template_id,1);?>" class="item">
                                        <img <?php if(!empty($data['itemprop_pic'])) {?>itemprop="<?php echo hc($data['itemprop_pic']);?>"<?php }?> src="<?php echo hc($data['img']);?>" alt="<?php echo hc($data['name']);?>">
                                        <div class="carousel-caption">
                                            <div class="header">
                                                <?php echo hc($data['name']);?>
                                            </div>
                                            <?php if(isset($_SESSION['user'])) {
                                                if($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                                    <a href="/<?php echo hc($module_name,1);?>/edit?module_name=<?php echo hc($module_name,1);?>&id=<?php echo hc($data['id']);?>&module_id=<?php echo hc($module_id,1);?>&template_id=<?php echo hc($template_id,1);?>&template=carusel" class="button_edit"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                                                <?php }
                                            }?>
                                            <a <?php if(!empty($data['itemprop_url'])) {?>itemprop="<?php echo hc($data['itemprop_url']);?>"<?php }?> class="carl_button" href="/<?php echo hc($module_name,1);?>/slider?id=<?php echo hc($data['id']);?>&template=<?php echo hc($template_id,1);?>"><span>Читать подробнее</span></a>
                                        </div>
                                    </div>
                                <?php } unset($row);?>
                                <script>
                                    var carl_div = $('#carusel_item<?php echo hc($template_id,1);?>');
                                    if(carl_div.length == 1) {
                                        carl_div[0].className += ' active';
                                    } else {
                                        carl_div[Math.floor(Math.random() * 2)].className += ' active';
                                    }
                                </script>
                            </div>

                            <!-- Controls -->
                            <a class="left carousel-control" href="#carusel_dota<?php echo hc($template_id,1)?>" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carusel_dota<?php echo hc($template_id,1)?>" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
				</div>
	<?php } else {?>
		<p>Слайдов пока нет</p>
	<?php }?>
	</<?php echo hc($container[$template_id]['container']);?>>
		<?php }
	}
}?>