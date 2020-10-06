<?php

require_once "app/Http/PageController.php";

use App\Http\PageController;

session_start();
$page = new PageController();
$page->load();
