<?php

require_once "app/Models/Comment.php";

use App\Models\Comment;

if (!$this->isUserAuthenticated()) { ?>
    <script>
      window.location.replace('status-forbidden');
    </script>
    <?
    return;
}

(new Comment(["CommentId" => $this->index, "CommentValue" => $_POST["user"]["message"]]))->update();

?>

<script>
  window.location.replace('/');
</script>
