<?php

declare(strict_types=1);

namespace Storage\App;

require_once "storage/app/AbstractSerializableStorage.php";

class UserStorage extends AbstractSerializableStorage
{
    public function __construct()
    {
        parent::__construct("user");
    }

    public function writeCookie($item, $expire = 0)
    {
        parent::writeCookie($item, $expire == 0 ? time() + 3600 * 24 * 7 : $expire);
    }
}
