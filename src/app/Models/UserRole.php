<?php

declare(strict_types=1);

namespace App\Models;

require_once "app/Models/Role.php";

class UserRole extends ActiveRecord
{
    public int $userId;
    public int $roleId;

    public function __construct(array $associative = [])
    {
        parent::__construct();
        $this->userId = (int)$associative["UserId"] ?? 0;
        $this->roleId = (int)$associative["RoleId"] ?? 0;
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
        $query = "SELECT R.Name FROM UserRoles AS UR";
        $query .= " INNER JOIN Roles AS R ON UR.RoleId = R.RoleId";
        $query .= " WHERE UR.UserId = {$this->userId};";

        return $this->mapFrom($query, Role::class);
    }
}
