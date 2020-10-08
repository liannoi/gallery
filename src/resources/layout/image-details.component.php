<?php

require_once "app/Models/Image.php";

use App\Models\Image;
use App\Models\User;

$image = (new Image(["ImageId" => $this->index]))->getById();
$author = (new User(["UserId" => $image->userId]))->getById();

?>

<div class="row mt-4 bg-dark pt-4 pb-4 border rounded">
    <div class="col-sm-12">
        <img class="img-fluid mx-auto d-block" style="max-height: 25rem;" src="<?= $image->path ?>" alt="Image"/>
    </div>
</div>

<div class="row mt-4">
    <div class="col-sm-12">
        <h3 class="text-capitalize"><?= $image->title ?></h3>
    </div>
</div>

<div class="row mt-1">
    <div class="col-sm-12">
        <span>by <?= $author->username ?></span>
    </div>
</div>

<div class="row mt-4">
    <div class="col-sm-12">
        <span class="mr-3"><strong>Taken:</strong> <?= $image->takenDate ?></span>
        <span><strong>Uploaded:</strong> <?= $image->uploadedDate ?></span>
    </div>
</div>

<div class="row mt-2">
    <div class="col-sm-12">
        <hr>
        <h4>Comments</h4>
    </div>
</div>
