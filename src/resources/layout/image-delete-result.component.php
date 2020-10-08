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

(new Image(["ImageId" => $this->index]))->delete();

?>

<script>
  window.location.replace('/');
</script>
