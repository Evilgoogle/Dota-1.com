<?php foreach($rows as $module_name=>$arr) {
	foreach($arr as $module_id=>$arr_bn) {
		foreach($arr_bn as $template_id=>$row) {?>
			<<?php echo hc($container[$template_id]['container']);?>>
                <div class="main_header">
                    <?php if(isset($_SESSION['user'])) {
                        if($_SESSION['user']['role'] == 'supermoderator') {
                            $role = 'supermoderator';
                        } elseif($_SESSION['user']['role'] == 'admin') {
                            $role = 'admin';
                        } elseif($_SESSION['user']['role'] == 'moderator') {
                            $role = 'moderator';
                        } elseif($_SESSION['user']['role'] == 'user') {
                            $role = 'user';
                        }
                    } else {
                        $role = 'user';
                    }?>
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
							<?php if(count($cat[$template_id])) {?>
								<div class="categories">
									<select class="form-control" data-toggle="tooltip" data-placement="bottom" title="Категорий" onchange="categories('<?php echo hc($module_id,1);?>','<?php echo hc($module_name,1);?>','<?php echo hc($template_id,1);?>', this.value, 'gal', '<?php echo hc($role)?>')">
										<option value="0">Общая</option>
										<?php foreach($cat[$template_id] as $get) {?>
											<option value="<?php echo hc($get['id']);?>"><?php echo hc($get['cat']);?></option>
										<?php }?>
									</select>
								</div>
							<?php }?>
						</div>
						<div class="right">
							<div class="block">
                                <?php if(isset($_SESSION['user'])) {
                                    if($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                        <a class="btn btn-default" href="/<?php echo hc($module_name,1);?>/add?module_name=<?php echo hc($module_name,1);?>&module_id=<?php echo hc($module_id,1);?>&template_id=<?php echo hc($template_id,1);?>&template=gal" data-toggle="tooltip" data-placement="bottom" title="Добавить запись">
                                            <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
                                        </a>
                                    <?php }
                                    if($_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                        <input type="submit" name="del[gal][<?php echo hc($module_name,1);?>]" value="Del" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Удалить запись">
                                    <?php }
                                }?>
							</div>
						</div>
					</div>
					<?php if($row->num_rows) {?>
                        <div id="gal_create<?php echo hc($template_id,1);?>"></div>
                        <div id="gal_default<?php echo hc($template_id,1);?>" <?php if(!empty($container[$template_id]['itemscope'])) {?>itemscope itemtype="<?php echo hc($container[$template_id]['itemscope']);?>"<?php }?>>
                            <?php while($set = $row->fetch_assoc()) {?>
                                <div class="gal_block">
                                    <?php if(isset($_SESSION['user'])) {
                                        if($_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                            <input type="checkbox" name="ids[]" value="<?php echo hc($set['id']);?>">
                                        <?php }
                                    }?>
                                    <div class="temp_gal">
                                        <a class="a_image" href="<?php echo hc($set['img']);?>" data-toggle="tooltip" data-placement="top" title="<?php echo hc($set['name'],1);?>" itemprop="contentUrl" data-fancybox="gallery<?php echo hc($template_id,1);?>"
                                           data-caption="
                                                    <div>Название: <b><?php echo hc($set['name'],1);?></b> </div>
                                                    <div>Добавил: <b>Dota</b></div>
                                                    <div>Дата добавление: <b><?php echo hc($set['date']);?></b></div>
                                                " data-options='{"animationEffect" : "zoom", "transitionEffect" : "tube"}'>
                                            <img src="<?php echo hc($set['preview']);?>" itemprop="thumbnail" alt="<?php echo hc($set['name'],1);?>">
                                        </a>
                                        <div class="box">
                                            <div class="info" data-toggle="tooltip" data-placement="bottom" title="Добавил: Dota">
                                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                            </div>
                                            <div class="info" data-toggle="tooltip" data-placement="bottom" title="Дата добавление: 27-08-2018">
                                                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                            </div>
                                            <a data-fancybox="small-gallery<?php echo hc($template_id,1);?>" data-options='{"animationEffect" : "zoom", "transitionEffect" : "tube"}' href="<?php echo hc($set['img']);?>" alt="<?php echo hc($set['name'],1);?>" class="info">
                                                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                            </a href="<?php echo hc($set['img']);?>" alt="<?php echo hc($set['name'],1);?>">
                                        </div>
                                        <?php if(!empty($set['itemprop_pic'])) {?><meta itemprop="<?php echo hc($set['itemprop_pic']);?>" content="<?php echo hc($set['img']);?>"><?php }?>
                                        <?php if(!empty($set['itemprop_author'])) {?><meta itemprop="<?php echo hc($set['itemprop_author']);?>" content="Dota"><?php }?>
                                        <?php if(!empty($set['itemprop_date'])) {?><meta itemprop="<?php echo hc($set['itemprop_date']);?>" content="<?php echo hc($set['date']);?>"><?php }?>
                                    </div>
                                </div>
                            <?php }?>
                        </div>
					<?php } else {?>
						<p>Изображений пока нет</p>
					<?php }?>
				</form>
			</<?php echo hc($container[$template_id]['container']);?>>
		<?php }
	}
}?>