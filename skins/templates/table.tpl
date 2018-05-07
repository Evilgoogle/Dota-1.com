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
                            if(count($cat[$template_id])) {
                                $cat_json = json_encode($cat[$template_id]);
                            } else {
                                $cat_json = '\'\'';
                            }
                            if(count($dota_cat[$template_id])) {
                                $dota_cat_json = json_encode($dota_cat[$template_id]);
                            } else {
                                $dota_cat_json = '\'\'';
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
                                <button id="button_list<?php echo hc($template_id,1);?>" type="button" class="btn btn-default" onclick="view_system('list',<?php echo hc($data_json);?>, <?php echo hc($module_id,1);?>, '<?php echo hc($module_name,1);?>', <?php echo hc($template_id,1);?>, '<?php echo hc($role)?>')">
                                    <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                                </button>
                                <button id="button_cells<?php echo hc($template_id,1);?>" type="button" class="btn btn-default" onclick="view_system('cells',<?php echo hc($data_json);?>, <?php echo hc($module_id,1);?>, '<?php echo hc($module_name,1);?>', <?php echo hc($template_id,1);?>, '<?php echo hc($role)?>');">
                                    <span class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
                                </button>
                                <button id="button_grid<?php echo hc($template_id,1);?>" type="button" class="btn btn-default" onclick="view_system('grid',<?php echo hc($data_json);?>, <?php echo hc($module_id,1);?>, '<?php echo hc($module_name,1);?>', <?php echo hc($template_id,1);?>, <?php echo hc($cat_json,1)?>, <?php echo hc($dota_cat_json,1);?>);">
                                    <span class="glyphicon glyphicon-th" aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                        <div class="right">
                            <?php if(count($cat[$template_id])) {?>
                                <div class="categories">
                                    <select class="form-control" data-toggle="tooltip" data-placement="bottom" title="Категорий" onchange="categories('<?php echo hc($module_id,1);?>','<?php echo hc($module_name,1);?>','<?php echo hc($template_id,1);?>', this.value, 'table', '<?php echo hc($role)?>'); del_categories();">
                                        <option value="0">Общая</option>
                                        <?php foreach($cat[$template_id] as $get) {?>
                                            <option value="<?php echo hc($get['id']);?>"><?php echo hc($get['cat']);?></option>
                                        <?php }?>
                                    </select>
                                </div>
                            <?php }?>
                            <div class="block">
                            <?php if(isset($_SESSION['user'])) {
                                if($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                    <a class="btn btn-default" href="/<?php echo hc($module_name,1);?>/add?module_name=<?php echo hc($module_name,1);?>&module_id=<?php echo hc($module_id,1);?>&template_id=<?php echo hc($template_id,1);?>&template=table" data-toggle="tooltip" data-placement="bottom" title="Добавить запись">
                                        <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
                                    </a>
                                <?php }
                                if($_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                    <input type="submit" name="del[table][<?php echo hc($module_name,1);?>]" value="Del" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Удалить запись">
                                <?php }
                            }?>
                            </div>
                        </div>
                    </div>
                    <!-- Блок -->
                    <?php if(count($row)) {?>
                        <!--js view-->
                        <div id="table_create<?php echo hc($template_id,1);?>"></div>
                        <!--default view-->
                        <div id="table_default<?php echo hc($template_id,1);?>">
                            <?php if($container[$template_id]['view'] == 'list') {?>
                                <div class="table_list" <?php if(!empty($container[$template_id]['itemscope'])) {?>itemscope itemtype="<?php echo hc($container[$template_id]['itemscope']);?>"<?php }?>>
                                    <?php foreach ($row as $data) {
                                        if(isset($_SESSION['user'])) {
                                            if($_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                                <input type="checkbox" name="ids[]" value="<?php echo hc($data['id']);?>">
                                            <?php }
                                            if($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                                <a href="/<?php echo hc($module_name,1);?>/edit?module_name=<?php echo hc($module_name,1);?>&id=<?php echo hc($data['id']);?>&module_id=<?php echo hc($module_id,1);?>&template_id=<?php echo hc($template_id,1);?>&template=table" class="btn btn-primary"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                                            <?php }
                                        }?>
                                        <div class="table_block_list">
                                            <div class="temp_table">
                                                <div class="tree1"></div>
                                                <div class="tree2"></div>
                                                <div class="img"></div>
                                                <div class="death_knight"></div>
                                                <div class="block">
                                                    <div class="left">
                                                        <img <?php if(!empty($data['itemprop_pic'])) {?>itemprop="<?php echo hc($data['itemprop_pic']);?>"<?php }?> src="<?php echo hc($data['preview']);?>" alt="<?php echo hc($data['name']);?>">
                                                    </div>
                                                    <div class="rigth">
                                                        <a <?php if(!empty($data['itemprop_name'])) {?>itemprop="<?php echo hc($data['itemprop_name']);?>"<?php }?> class="header" href="/<?php echo hc($module_name,1);?>/view?id=<?php echo hc($data['id']);?>&template=<?php echo hc($template_id,1);?>"><?php echo hc($data['name'],1);?></a>
                                                        <div <?php if(!empty($data['itemprop_des'])) {?>itemprop="<?php echo hc($data['itemprop_des']);?>"<?php }?> class="text"><?php echo hc($data['des']);?></div>
                                                        <div class="addition">
                                                            <div class="block_date_view">
                                                                <div class="block_date">
                                                                    <div class="date"></div>
                                                                    <div <?php if(!empty($data['itemprop_date'])) {?>itemprop="<?php echo hc($data['itemprop_date']);?>"<?php }?> class="text1"><?php echo hc($data['date']);?></div>
                                                                </div>
                                                                <div class="block_view">
                                                                    <div class="view"></div>
                                                                    <div <?php if(!empty($data['itemprop_views'])) {?>itemprop="<?php echo hc($data['itemprop_views']);?>"<?php }?> class="text2">18</div>
                                                                </div>
                                                            </div>
                                                            <a <?php if(!empty($data['itemprop_url'])) {?>itemprop="<?php echo hc($data['itemprop_url']);?>"<?php }?> href="/<?php echo hc($module_name,1);?>/view&id=<?php echo hc($data['id']);?>&template=<?php echo hc($template_id,1);?>" class="button">Подробнее</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php }?>
                                </div>
                            <?php } else if($container[$template_id]['view'] == 'cells') {?>
                                <div class="table_cells" <?php if(!empty($container[$template_id]['itemscope'])) {?>itemscope itemtype="<?php echo hc($container[$template_id]['itemscope']);?>"<?php }?>>
                                    <?php foreach ($row as $data) {?>
                                        <div class="table_block_cells">
                                            <?php if(isset($_SESSION['user'])) {
                                                if($_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                                    <input type="checkbox" name="ids[]" value="<?php echo hc($data['id']);?>">
                                                <?php }
                                                if($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                                    <a href="/<?php echo hc($module_name,1);?>/edit?module_name=<?php echo hc($module_name,1);?>&id=<?php echo hc($data['id']);?>&module_id=<?php echo hc($module_id,1);?>&template_id=<?php echo hc($template_id,1);?>&template=table" class="btn btn-primary"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                                                <?php }
                                            }?>
                                            <div class="temp_table">
                                                <div class="tree1"></div>
                                                <div class="tree2"></div>
                                                <div class="tree3"></div>
                                                <div class="img"></div>
                                                <div class="death_knight"></div>
                                                <div class="block">
                                                    <div class="top">
                                                        <img <?php if(!empty($data['itemprop_pic'])) {?>itemprop="<?php echo hc($data['itemprop_pic']);?>"<?php }?> src="<?php echo hc($data['preview']);?>" alt="<?php echo hc($data['name']);?>">
                                                    </div>
                                                    <div class="bottom">
                                                        <a <?php if(!empty($data['itemprop_name'])) {?>itemprop="<?php echo hc($data['itemprop_name']);?>"<?php }?> class="header" href="/<?php echo hc($module_name,1);?>/view?id=<?php echo hc($data['id']);?>&template=<?php echo hc($template_id,1);?>"><?php echo hc($data['name'],1);?></a>
                                                        <div <?php if(!empty($data['itemprop_des'])) {?>itemprop="<?php echo hc($data['itemprop_des']);?>"<?php }?> class="text"><?php echo hc($data['des']);?></div>
                                                        <div class="addition">
                                                            <div class="block_date">
                                                                <div class="date"></div>
                                                                <div <?php if(!empty($data['itemprop_date'])) {?>itemprop="<?php echo hc($data['itemprop_date']);?>"<?php }?> class="text1"><?php echo hc($data['date']);?></div>
                                                            </div>
                                                            <div class="block_view">
                                                                <div class="view"></div>
                                                                <div <?php if(!empty($data['itemprop_views'])) {?>itemprop="<?php echo hc($data['itemprop_views']);?>"<?php }?> class="text2">18</div>
                                                            </div>
                                                        </div>
                                                        <a <?php if(!empty($data['itemprop_url'])) {?>itemprop="<?php echo hc($data['itemprop_url']);?>"<?php }?> href="/<?php echo hc($module_name,1);?>/view?id=<?php echo hc($data['id']);?>&template=<?php echo hc($template_id,1);?>" class="button">Подробнее</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php }?>
                                </div>
                            <?php } elseif($container[$template_id]['view'] == 'grid') {?>
                                <div class="table_grid" <?php if(!empty($container[$template_id]['itemscope'])) {?>itemscope itemtype="<?php echo hc($container[$template_id]['itemscope']);?>"<?php }?>>
                                    <div class="table_block_grid">
                                    <?php if(count($cat[$template_id])) {?>
                                        <div class="top">
                                            <?php foreach($cat[$template_id] as $value) {?>
                                                <div class="cats">
                                                    <div class="header"><?php echo hc($value['cat'],1); ?></div>
                                                    <div class="block">
                                                        <div class="diablo"></div>
                                                        <div class="border">
                                                            <?php if(count($dota_cat[$template_id])) {
                                                                foreach ($dota_cat[$template_id] as $dota_value) {
                                                                    if($value['id'] == $dota_value['cat']) {?>
                                                                        <a href="/<?php echo hc($module_name,1);?>/view?id=<?php echo hc($dota_value['id']);?>&template=<?php echo hc($template_id,1);?>" class="grid">
                                                                            <img <?php if(!empty($dota_value['itemprop_pic'])) {?>itemprop="<?php echo hc($dota_value['itemprop_pic']);?>"<?php }?> src="<?php echo hc($dota_value['mini']);?>" alt="<?php echo hc($dota_value['name']);?>" data-toggle="tooltip" data-placement="left" title="<?php echo hc($dota_value['name']);?>">
                                                                        </a>
                                                                    <?php }
                                                                }
                                                            }?>
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php } unset($cat[$template_id]);?>
                                        </div>
                                    <?php } ?>
                                    <div class="bottom">
                                        <?php foreach ($row as $data) {?>
                                            <a href="/<?php echo hc($module_name,1);?>/view?id=<?php echo hc($data['id']);?>&template=<?php echo hc($template_id,1);?>" class="grid">
                                                <img <?php if(!empty($data['itemprop_pic'])) {?>itemprop="<?php echo hc($data['itemprop_pic']);?>"<?php }?> src="<?php echo hc($data['mini']);?>" alt="<?php echo hc($data['name']);?>" data-toggle="tooltip" data-placement="left" title="<?php echo hc($data['name']);?>">
                                            </a>
                                        <?php } unset($row);?>
                                    </div>
                                </div>
                                </div>
                            <?php }?>
                        </div>
                    <?php } else {?>
                        <p>Записи пока нет</p>
                    <?php }?>
                </form>
            </<?php echo hc($container[$template_id]['container']);?>>
		<?php }
	}
}?>