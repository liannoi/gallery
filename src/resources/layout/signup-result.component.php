<div class="row mt-5 mb-5">
    <div class="col-sm-12 mt-3">
        <?

        require_once "app/Models/User.php";
        require_once "app/Models/UserRole.php";

        use App\Models\User;
        use App\Models\UserRole;

        $username = $_POST["user"]["username"];
        $email = $_POST["user"]["email"];
        $password = $_POST["user"]["password"];
        $repeatPassword = $_POST["user"]["repeat_password"];
        $user = (new User(["Username" => $username, "Email" => $email, "PasswordHash" => hash("sha256", $password)]));
        $user->create();
        $lastUserId = $user->getLast()->userId;
        $roles = $_POST["user"]["roles"];

        foreach ($roles as $role) {
            (new UserRole(["UserId" => $lastUserId, "RoleId" => $role]))->create();
        }

        ?>
    </div>
</div>

<script>
  window.location.replace('/');
</script>
