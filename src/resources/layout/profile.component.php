<?

if (!$this->isUserAuthenticated()) { ?>
    <script>
      window.location.replace('status-forbidden');
    </script>
    <?
    return;
} ?>

<div class="row mt-4">
    <div class="col-sm-12">
        <h1>Profile</h1>
        <hr>
    </div>
</div>

<div class="row mt-1">
    <div class="col-sm-12">
        <p>On this page the user can view and customize their profile.</p>
    </div>
</div>

<div class="row mt-1">
    <div class="col-sm-12">
        <table class="table border table-striped table-sm table-responsive-sm">
            <thead class="thead-light table-bordered">
            <tr>
                <th scope="col">Username</th>
                <th scope="col">Email</th>
                <th scope="col">Roles</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row"><?= $this->user->username ?></th>
                <td><?= $this->user->email ?> (<?= $this->user->isEmailVerified ? "+" : "-" ?>)</td>
                <td><?= implode(", ", $this->getUserRoles()) ?></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<?
if (!$this->hasUserWritePrivileges()) {
    return;
} ?>

<div class="row mt-4">
    <div class="col-sm-12">
        <h3>Images</h3>
    </div>
</div>

<div class="row mt-2">
    <div class="col-sm-12">
        <p>You are in the role of "Administrator" and have privileges for advanced operations with images.</p>
    </div>
</div>

<div class="row mt-1">
    <div class="col-sm-12">
        <a href="image-upload" class="btn btn-primary">Upload image</a>
    </div>
</div>
