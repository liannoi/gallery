<?

ob_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title><?= $this->title ?> Gallery</title>
    <link rel="icon" href="public/favicon.ico">
    <link rel="stylesheet" href="public/css/app.component.css">
    <link rel="stylesheet" href="public/css/image-details.component.css">
    <link rel="stylesheet" href="public/css/main.component.css">
    <link rel="stylesheet" href="public/css/nav-top-menu.component.css">
    <link rel="stylesheet" href="public/css/sign-in.component.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>

<body>
<?
include "resources/layout/nav-top-menu.component.php" ?>

<div class="container">
    <main role="main">
        <?
        include $this->content ?>
    </main>
</div>

<?
include "resources/layout/nav-footer.component.php" ?>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
<script src="public/js/app.component.js"></script>
<script src="public/js/main.component.js"></script>
</body>
</html>
