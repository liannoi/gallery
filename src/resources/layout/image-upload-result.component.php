<?php

require_once "app/Models/Image.php";

use App\Models\Image;

if (!$this->isUserAuthenticated()) { ?>
    <script>
      window.location.replace('status-forbidden');
    </script>
    <?
    return;
}

$title = $_POST["photo"]["title"];

$path = $_FILES["photo"]["name"];
$ext = pathinfo($path, PATHINFO_EXTENSION);
$uuid = uniqid();
$photo = "public/images/$uuid.$ext";

$type = $_FILES["photo"]["type"];
if ($type !== "image/png" && $type !== "image/jpeg" && $type !== "image/jpg") {
    echo "<h2 class='text-danger'>TYPE</h2>";
    return;
}

$size = $_FILES["photo"]["size"];
/* 7 mb in bytes */
if ($size >= 7340032) {
    echo "<h2 class='text-danger'>SIZE</h2>";
    return;
}

if (file_exists($photo)) {
    echo "<h2 class='text-danger'>EXISTS</h2>";
    return;
}

if (!copy($_FILES["photo"]["tmp_name"], $photo)) {
    echo "<h2 class='text-danger'>COPY</h2>";
    return;
}

(new Image(["Title" => $title, "Path" => $photo, "UserId" => $this->user->userId]))->create();

?>

<script>
  window.location.replace('/');
</script>
