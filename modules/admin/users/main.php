<?php
if (isset($_GET['ok_search'], $_GET['search'])) {
    $users = q("SELECT * FROM `fw_users` WHERE `login` LIKE '%".es($_GET['search'])."%'");
} else {
    $users = q("SELECT * FROM `fw_users`");
}