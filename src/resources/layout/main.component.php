<?

require_once "app/Models/Image.php";

use App\Models\Image;
use App\Models\User;

$model = new Image();
$images = $model->getAll();
$totalItems = count($images);
$itemsPerPage = 25;
$totalPages = ceil($totalItems / $itemsPerPage);
if ($this->index === 0) {
    $this->index = 1;
}

$currentPage = ($this->index - 1) * $itemsPerPage;
$limitedImages = $model->getAllLimit($currentPage, $itemsPerPage);
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
    return;
} ?>

<div class="card-columns mt-5">
    <?
    foreach ($limitedImages as $image) {
        $user->userId = $image->userId ?>
        <div class="card bg-dark text-white">
            <img src="<?= $image->path ?>" loading="lazy" class="card-img" alt="Image">

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

<nav class="mt-5">
    <ul class="pagination flex-wrap justify-content-center">
        <li class="page-item <?= $this->index == 1 ? 'disabled' : '' ?>">
            <a class="page-link" href="main@<?= $this->index - 1 ?>">Previous</a>
        </li>

        <?
        for ($i = 1; $i <= $totalPages; $i++) {
            if ($i === $this->index) { ?>
                <li class="page-item active" aria-current="page">
                        <span class="page-link">
                            <?= $i ?>
                            <span class="sr-only">(current)</span>
                        </span>
                </li>
                <?
            } else { ?>
                <li class="page-item">
                    <a class="page-link" href="main@<?= $i ?>"><?= $i ?></a>
                </li>
                <?
            } ?>
            <?
        } ?>

        <li class="page-item <?= $this->index == $totalPages ? 'disabled' : '' ?>">
            <a class="page-link" href="main@<?= $this->index + 1 ?>">Next</a>
        </li>
    </ul>
</nav>
