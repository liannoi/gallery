<?

require_once "app/Models/Comment.php";

use App\Models\Comment;

if (!$this->isUserAuthenticated()) { ?>
    <script>
      window.location.replace('status-forbidden');
    </script>
    <?
    return;
}

$commentValue = (new Comment(["CommentId" => $this->index]))->getById()->commentValue;

?>

<div class="row mt-5 mb-5 d-flex justify-content-center align-items-center">
    <div class="col-sm-4">
        <h3 class="text-center">Editing a comment</h3>
    </div>
</div>

<div class="row mb-5 d-flex justify-content-center align-items-center">
    <div class="col-sm-4">
        <form action="comment-update-result@<?= $this->index ?>" method="post" class="bg-white p-4 comment-form-body">
            <div class="form-group">
                <label for="user_message" class="font-weight-bold">Value</label>

                <textarea id="user_message" name="user[message]" class="form-textarea"><?= $commentValue ?></textarea>
            </div>

            <div class="form-row mt-4">
                <div class="col-sm-12">
                    <button type="submit" class="btn btn-success w-100 font-weight-bold">Submit</button>
                </div>
            </div>
        </form>
    </div>
</div>
