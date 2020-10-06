<?php

declare(strict_types=1);

namespace Storage\App;

abstract class AbstractStorage
{
    protected string $key;

    public function __construct(string $key)
    {
        $this->key = $key;
    }

    abstract public function writeSession($item);

    abstract public function readSession();

    abstract public function writeCookie($item, $expire);

    abstract public function readCookie();

    public function destroyCookie()
    {
        if (isset($_COOKIE[$this->key])) {
            setcookie($this->key, "", -1);
        }
    }
}
