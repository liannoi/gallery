<?php

declare(strict_types=1);

namespace App\Models;

class Role extends ActiveRecord
{
    public int $roleId;
    public string $name;
    public bool $isRemoved;

    public function __construct(array $associative = array())
    {
        parent::__construct();
        $this->roleId = (int)$associative["RoleId"] ?? 0;
        $this->name = $associative["Name"] ?? "";
        $this->isRemoved = (bool)$associative["IsRemoved"] ?? false;
    }

    public function create(): void
    {
        // TODO: Implement create() method.
    }

    public function getAll(): array
    {
        $query = "SELECT * FROM Roles";

        return $this->mapFrom($query, Role::class);
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
}
