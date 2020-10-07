<?

require_once "app/Models/Image.php";

use App\Models\Image;

(new Image(["ImageId" => $this->index]))->delete();

?>

<script>
  window.location.replace('/');
</script>
