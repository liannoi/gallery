<?php

declare(strict_types=1);

namespace App\Http;

require_once "app/Models/User.php";
require_once "app/Models/UserRole.php";
require_once "app/Models/UserPrivilege.php";
require_once "storage/app/UserStorage.php";

use App\Models\Privilege;
use App\Models\User;
use App\Models\UserPrivilege;
use App\Models\UserRole;
use Storage\App\UserStorage;

class PageController
{
    private User $user;
    private array $names;
    private string $title;
    private string $id;
    private string $content;
    private string $template;

    public function __construct()
    {
        $this->id = $this->getId();
        $this->user = $this->getUser();
        $this->setupNames();
        $this->title = $this->names[$this->id];
        $this->content = "resources/layout/{$this->id}.component.php";
        $this->template = "resources/layout/app.component.php";
    }

    private function getId(): string
    {
        $id = $_GET["id"];
        $this->setupNames();

        if (!isset($id)) {
            return "main";
        } elseif (!array_key_exists($id, $this->names)) {
            return "status-not-found";
        }

        return $id;
    }

    /** @noinspection PhpUnused */
    private function setupNames(): void
    {
        $this->names = require "resources/values-en/names.php";
    }

    private function getUser(): User
    {
        $sessionUser = $_SESSION["user"];
        $cookieUser = $_COOKIE["user"];
        $cachedUser = new User();

        if (isset($sessionUser)) {
            $cachedUser = unserialize($sessionUser);
        } elseif (isset($cookieUser)) {
            $cachedUser = unserialize($cookieUser);
        }

        if ($cachedUser->userId == 0) {
            return new User();
        }

        $actualUser = (new User(["UserId" => $cachedUser->userId]))->getById();
        $userStorage = new UserStorage();
        $userStorage->writeSession($actualUser);
        $userStorage->writeCookie($actualUser);

        return $userStorage->readSession();
    }

    public function load(): void
    {
        include $this->template;
    }

    public function isUserAuthenticated()
    {
        return $this->user->username != "";
    }

    /** @noinspection PhpUnused */

    public function hasUserWritePrivileges(): bool
    {
        $isUserAdministrator = false;

        foreach ($this->getUserRoles() as $role) {
            if ($role->roleId !== 2) {
                continue;
            }

            $isUserAdministrator = true;
        }

        if (!$isUserAdministrator) {
            return false;
        }

        $userPrivileges = (new UserPrivilege(["UserId" => $this->user->userId]))->getByUser();
        $writePrivilege = (new Privilege(["PrivilegeId" => 2]))->getById();
        $hasUserWritePrivileges = false;

        foreach ($userPrivileges as $privilege) {
            if ($privilege->privilegeId !== $writePrivilege->privilegeId) {
                continue;
            }

            $hasUserWritePrivileges = true;
            break;
        }

        if (!$hasUserWritePrivileges) {
            return false;
        }

        return true;
    }

    /** @noinspection PhpUnused */

    public function getUserRoles(): array
    {
        return (new UserRole(["UserId" => $this->user->userId]))->getByUser();
    }
}
