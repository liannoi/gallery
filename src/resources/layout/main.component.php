<?

require_once "app/Models/Image.php";

use App\Models\Image;
use App\Models\User;

$images = (new Image())->getAll();
$user = new User();

?>

<div class="row mt-5 d-flex justify-content-center align-items-center">
    <div class="col-sm-10 col-md-5">
        <h2 class="mt-2 text-center headline">Gallery</h2>
    </div>
</div>

<div class="card-columns mt-5">
    <?
    foreach ($images as $image) {
        $user->userId = $image->userId ?>
        <div class="card bg-dark text-white">
            <img src="<?= $image->path ?>" loading="lazy" class="card-img">
            <div class="card-footer">
                <?
                if ($this->hasUserWritePrivileges()) { ?>
                    <button class="btn btn-outline-danger">Delete</button>
                    <?
                } ?>
                <small class="float-right mb-md-3">Photo by <?= $user->getById()->username ?></small>
            </div>
        </div>
        <?
    } ?>
</div>
