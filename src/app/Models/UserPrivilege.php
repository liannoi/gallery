<?php

declare(strict_types=1);

namespace App\Models;

require_once "app/Models/Privilege.php";

class UserPrivilege extends ActiveRecord
{
    public int $userId;
    public int $privilegeId;

    public function __construct(array $associative = array())
    {
        parent::__construct();
        $this->userId = (int)$associative["UserId"] ?? 0;
        $this->privilegeId = (int)$associative["PrivilegeId"] ?? 0;
    }

    public function create(): void
    {
        // TODO: Implement create() method.
    }

    public function getAll(): array
    {
        // TODO: Implement getAll() method.
    }

    public function getById()
    {
        // TODO: Implement getById() method.
    }

    public function update(): void
    {
        // TODO: Implement update() method.
    }

    public function delete(): void
    {
        // TODO: Implement delete() method.
    }

    public function getByUser(): array
    {
        $query = "SELECT *";
        $query .= " FROM UserPrivileges AS UR";
        $query .= " INNER JOIN Users AS U ON UR.UserId = U.UserId";
        $query .= " WHERE U.UserId = 1;";

        return $this->mapFrom($query, Privilege::class);
    }
}