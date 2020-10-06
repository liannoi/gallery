<?php

require_once "app/Models/Image.php";

use App\Models\Image;

$images = (new Image())->getAll();

?>

<div class="row mt-5 d-flex justify-content-center align-items-center">
    <div class="col-sm-10 col-md-5">
        <h2 class="mt-5 text-center headline">Gallery</h2>
    </div>
</div>

<div class="card-columns mt-4 mb-5">
    <?
    foreach ($images as $image) { ?>
        <div class="card bg-dark text-white">
            <img src="<?= $image->path ?>" class="card-img" alt="...">
            <div class="card-img-overlay">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                    content. This content is a little bit longer.</p>
                <p class="card-text">Last updated 3 mins ago</p>
            </div>
        </div>
        <?
    } ?>
</div>
