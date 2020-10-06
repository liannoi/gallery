<?php

require_once "app/Models/UserRole.php";

use App\Models\UserRole;

if (!$this->isUserAuthenticated()) { ?>
    <script>
      window.location.replace('status-forbidden');
    </script>
    <?
}

$userRoles = (new UserRole(["UserId" => $this->user->userId]))->getByUser();

if (count($userRoles) < 2) {
    $parsedUserRoles = $userRoles[0]->name;
} else {
    $parsedUserRoles = implode(", ", $userRoles);
}
?>

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
                <td><?= $parsedUserRoles ?></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="row mt-4 mb-5">
    <div class="col-sm-12">
        <h3>Images</h3>
    </div>
</div>
