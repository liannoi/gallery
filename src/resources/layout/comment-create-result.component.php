<?php

require_once "app/Models/Comment.php";

use App\Models\Comment;

if (!$this->isUserAuthenticated()) { ?>
    <script>
      window.location.replace('status-forbidden');
    </script>
    <?
}

$message = $_POST["user"]["message"];
$comment = new Comment(["UserId" => $this->user->userId, "CommentValue" => $message, "ImageId" => $this->index]);
$comment->create();

?>

<script>
  window.location.replace('/image-details@<?=$this->index?>');
</script>
