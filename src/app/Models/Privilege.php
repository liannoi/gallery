<?php

declare(strict_types=1);

namespace App\Models;

class Privilege extends ActiveRecord
{
    public int $privilegeId;
    public string $privilegeType;
    public bool $isRemoved;

    public function __construct(array $associative = array())
    {
        parent::__construct();
        $this->privilegeId = (int)$associative["PrivilegeId"] ?? 0;
        $this->privilegeType = $associative["PrivilegeType"] ?? "";
        $this->isRemoved = (bool)$associative["IsRemoved"] ?? false;
    }

    public function create(): void
    {
        // TODO: Implement create() method.
    }

    public function getAll(): array
    {
        // TODO: Implement getAll() method.
    }

    public function getById(): Privilege
    {
        $query = "SELECT * FROM Privileges WHERE PrivilegeId = ?";

        return new Privilege(
            $this->query($query, "i", $this->privilegeId)
                ->get_result()
                ->fetch_assoc()
        );
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