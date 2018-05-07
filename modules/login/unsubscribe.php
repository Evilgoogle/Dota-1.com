<?php
if(isset($_POST['email'],$_POST['hash'],$_POST['key'],$_POST['antixsrf'],$_SESSION['antixsrf']) && $_SESSION['antixsrf'] == $_POST['antixsrf'] && $_POST['hash'] == myHash($_POST['email'].preg_replace('#^.{2}(.+).{2}$#u',"\\1",$_POST['key']))) {
	q("
		INSERT IGNORE INTO `fw_unsubscribe` SET
		`email` = '".es($_POST['email'])."'
	");
	$_SESSION['info'] = ''.hc($_POST['email']).' внесён в список заблокированных';
	redirect('this');
}
