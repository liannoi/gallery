<div class="row mt-5 mb-5 d-flex justify-content-center align-items-center">
    <div class="col-sm-4">
        <h3 class="text-center">Sign in to Gallery</h3>
    </div>
</div>

<div class="row mb-5 d-flex justify-content-center align-items-center">
    <div class="col-sm-4">
        <form action="sign-in-result" method="post" class="bg-white p-4 auth-form-body">
            <div class="form-group">
                <label for="user_username" class="font-weight-bold">Username</label>

                <input type="text" class="form-control" id="user_username" name="user[username]" required>
            </div>

            <div class="form-group">
                <label for="user_password" class="font-weight-bold">Password</label>

                <input type="password" class="form-control" id="user_password" name="user[password]" required>
            </div>

            <div class="form-check mb-4">
                <input type="checkbox" class="form-check-input" name="user[remember]" id="user_remember"
                       value="true">

                <label for="user_remember" class="form-check-label">Remember me</label>
            </div>

            <div class="form-row">
                <div class="col-sm-12">
                    <button type="submit" class="btn btn-success w-100 font-weight-bold">Sign in</button>
                </div>
            </div>
        </form>
    </div>
</div>
