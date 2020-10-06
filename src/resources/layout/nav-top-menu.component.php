<header>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark border-bottom">
        <div class="container">
            <a class="navbar-brand font-weight-bold" href="/">Gallery</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#headerMenu"
                    aria-controls="headerMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse collapse d-sm-inline-flex" id="headerMenu">
                <ul class="navbar-nav ml-auto">
                    <?
                    if (!$this->isUserAuthenticated()) { ?>
                        <li class="nav-item">
                            <a href="sign-in" class="nav-link font-weight-bold">Sign in</a>
                        </li>

                        <li class="nav-item">
                            <a href="signup" class="nav-link font-weight-bold">Sign up</a>
                        </li>
                        <?
                    } else { ?>
                        <li class="nav-item">
                            <a href="/" class="nav-link font-weight-bold disabled text-white">
                                Signed in as <strong><?= $this->user->username ?></strong>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="profile" class="nav-link font-weight-bold">Your profile</a>
                        </li>

                        <li class="nav-item">
                            <a href="sign-out-result" class="nav-link font-weight-bold">Sign out</a>
                        </li>
                        <?
                    } ?>
                </ul>
            </div>
        </div>
    </nav>
</header>
