<div class="row mt-5 mb-5">
    <div class="col-sm-12 mt-3">
        <?

        require_once "app/Models/User.php";
        require_once "storage/app/UserStorage.php";

        use App\Models\User;
        use Storage\App\UserStorage;

        $username = $_POST["user"]["username"];
        $password = $_POST["user"]["password"];
        $user = (new User(["Username" => $username, "PasswordHash" => hash("sha256", $password)]))->auth();
        $userStorage = new UserStorage();
        $userStorage->writeSession($user);

        if ($_POST["user"]["remember"] === "true") {
            $userStorage->writeCookie($user);
        }

        ?>
    </div>
</div>

<script>
  window.location.replace('/profile');
</script>
