<?php

declare(strict_types=1);

namespace Storage\App;

require_once "storage/app/AbstractStorage.php";

abstract class AbstractSerializableStorage extends AbstractStorage
{
    public function __construct(string $key)
    {
        parent::__construct($key);
    }

    public function writeSession($item)
    {
        $_SESSION[$this->key] = serialize($item);
    }

    public function readSession()
    {
        return unserialize($_SESSION[$this->key]);
    }

    public function writeCookie($item, $expire)
    {
        setcookie($this->key, serialize($item), $expire);
    }

    public function readCookie()
    {
        return unserialize($_COOKIE[$this->key]);
    }
}
