<?php

declare(strict_types=1);

namespace App\Models;

require_once "app/Models/ActiveRecord.php";

class User extends ActiveRecord
{
    public int $userId;
    public string $username = "";
    public string $email;
    public bool $emailConfirmed;
    public string $passwordHash;
    public bool $isRemoved;

    public function __construct(array $associative = array())
    {
        parent::__construct();
        $this->userId = (int)$associative["UserId"] ?? 0;
        $this->username = $associative["Username"] ?? "";
        $this->email = $associative["Email"] ?? "";
        $this->emailConfirmed = (bool)$associative["EmailConfirmed"] ?? "";
        $this->passwordHash = $associative["PasswordHash"] ?? "";
        $this->isRemoved = (bool)$associative["IsRemoved"] ?? "";
    }

    public function create(): void
    {
        $query = "INSERT INTO Users (Username, Email, PasswordHash)";
        $query .= " VALUES (?, ?, ?)";

        $this->query($query, "sss", $this->username, $this->email, $this->passwordHash);
    }

    public function getAll(): array
    {
        // TODO: Implement getAll() method.
    }

    public function getById()
    {
        $query = "SELECT * FROM Users WHERE UserId = ?";

        return new User(
            $this->query($query, "i", $this->userId)
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

    public function auth(): User
    {
        $query = "SELECT U.UserId, U.Username, U.Email, U.EmailConfirmed, U.Email FROM Users AS U";
        $query .= " WHERE Username = ? AND PasswordHash = ?";

        $associative = $this->query($query, "ss", $this->username, $this->passwordHash)
            ->get_result()
            ->fetch_assoc();

        return new User($associative);
    }

    public function getLast(): User
    {
        $query = "SELECT * FROM Users ORDER BY UserId DESC LIMIT 1";

        return $this->mapFrom($query, User::class)[0];
    }

    public function __toString(): string
    {
        return $this->username;
    }
}
