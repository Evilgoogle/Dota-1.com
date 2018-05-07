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
            <div itemscope itemtype="<?php echo hc($container[$template_id]['itemscope']);?>">
                <?php if(isset($_SESSION['user'])) {?>
                    <div class="table_menu">
                        <div class="right">
                            <?php if($_SESSION['user']['role'] == 'moderator' || $_SESSION['user']['role'] == 'supermoderator' || $_SESSION['user']['role'] == 'admin') {?>
                                <a href="/<?php echo hc($module_name,1);?>/edit?id=<?php echo hc($row['id']);?>&module_id=<?php echo hc($module_id,1);?>&template_id=<?php echo hc($template_id,1);?>&template=one&&module_name=<?php echo hc($module_name,1);?>" class="btn btn-primary"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                            <?php }?>
                        </div>
                    </div>
                <?php }?>
                <div class="base_text"><?php echo $row['text'];?></div>
            </div>
		</<?php echo hc($container[$template_id]['container']);?>>
		<?php }
	}
}?>