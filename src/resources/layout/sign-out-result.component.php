<?php

use Storage\App\UserStorage;

session_destroy();
$userStorage = new UserStorage();
$userStorage->destroyCookie();

?>

<script>
  window.location.replace('/');
</script>
