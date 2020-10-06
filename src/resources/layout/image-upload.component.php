<?

if (!$this->isUserAuthenticated()) { ?>
    <script>
      window.location.replace('status-forbidden');
    </script>
    <?
} ?>

<div class="row mt-5 d-flex justify-content-center align-items-center">
    <div class="col-sm-4">
        <h3 class="text-center">Uploading photo</h3>
    </div>
</div>

<div class="row mt-5 d-flex justify-content-center align-items-center">
    <div class="col-sm-4">
        <form action="image-upload-result" method="post" class="bg-white p-4 image-upload-form-body"
              enctype="multipart/form-data">
            <div class="form-group">
                <label for="photo_title" class="font-weight-bold">Title</label>

                <input type="text" class="form-control" id="photo_title" name="photo[title]" required>
            </div>

            <div class="input-group">
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="photo" id="photo" required>

                    <label class="custom-file-label" for="photo">Choose file</label>
                </div>
            </div>

            <div class="form-row mt-4">
                <div class="col-sm-12">
                    <button type="submit" class="btn btn-success w-100 font-weight-bold">Upload</button>
                </div>
            </div>
        </form>
    </div>
</div>
