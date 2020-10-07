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

<?
if (count($images) == 0) { ?>
    <div class="row mt-3 d-flex justify-content-center align-items-center">
        <div class="col-sm-12 col-md-9">
            <h3 class="text-center subhead text-muted">The gallery is empty at the moment.</h3>
        </div>
    </div>
    <?
} else { ?>
    <div class="card-columns mt-5">
        <?
        foreach ($images as $image) {
            $user->userId = $image->userId ?>
            <div class="card bg-dark text-white">
                <img src="<?= $image->path ?>" loading="lazy" class="card-img">
                <div class="card-footer">
                    <?
                    if ($this->hasUserWritePrivileges()) { ?>
                        <a href="image-delete-result@<?= $image->imageId ?>" class="btn btn-outline-danger">Delete</a>
                        <?
                    } ?>
                    <small class="float-right mb-md-3">Photo by <?= $user->getById()->username ?></small>
                </div>
            </div>
            <?
        } ?>
    </div>
    <?
} ?>