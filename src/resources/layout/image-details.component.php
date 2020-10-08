<?php

require_once "app/Models/Image.php";
require_once "app/Models/Comment.php";

use App\Models\Comment;
use App\Models\Image;
use App\Models\User;

$imageId = ["ImageId" => $this->index];
$image = (new Image($imageId))->getById();
$author = (new User(["UserId" => $image->userId]))->getById();
$commentAuthor = new User();
$comments = (new Comment($imageId))->getByImage();

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
        <h5><?= count($comments) ?> Comments</h5>
    </div>
</div>

<div class="row mt-3">
    <div class="col-sm-12">
        <?
        if ($this->isUserAuthenticated()) { ?>
            <form action="comment-create-result@<?= $this->index ?>" method="post" class="mb-4">
                <div class="form-group">
                    <label for="user_message" class="font-weight-bold">Add a public comment...</label>

                    <textarea id="user_message" name="user[message]" class="form-textarea"></textarea>
                </div>

                <div class="form-row mt-4">
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-primary float-right font-weight-bold">Comment</button>
                    </div>
                </div>
            </form>
            <?
        } ?>
        <?
        $count = count($comments);
        for ($i = 0; $i < $count; $i++) { ?>
            <div class="row mt-3">
                <div class="col-sm-12">
                    <span class="font-weight-bold">
                        <?
                        $commentAuthor->userId = $comments[$i]->userId;
                        echo $commentAuthor->getById(); ?>
                    </span>
                    <?
                    $isAuthenticated = $this->isUserAuthenticated();
                    $isAuthorOrAdministrator = ($this->isUserAuthorComment($comments[$i]) ||
                        $this->isUserAdministrator());

                    $isAuthenticatedAndHavePermission = $isAuthenticated && $isAuthorOrAdministrator;
                    if ($isAuthenticatedAndHavePermission) { ?>
                        <div class="btn-group float-right mb-2">
                            <a href="comment-update@<?= $comments[$i]->commentId ?>"
                               class="btn btn-light font-weight-bold">Edit</a>
                            <a href="comment-delete-result@<?= $comments[$i]->commentId ?>"
                               class="btn btn-light font-weight-bold">Delete</a>
                        </div>
                        <?
                    } ?>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col-sm-12">
                    <span><?= $comments[$i]->commentValue ?></span>
                </div>
            </div>

            <?
        } ?>
    </div>
</div>
