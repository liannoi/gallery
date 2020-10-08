<?php

declare(strict_types=1);

namespace App\Models;

class Comment extends ActiveRecord
{
    public int $commentId;
    public int $imageId;
    public int $userId;
    public string $commentValue;
    public bool $isRemoved;

    public function __construct(array $associative = [])
    {
        parent::__construct();
        $this->commentId = (int)$associative["CommentId"] ?? 0;
        $this->imageId = (int)$associative["ImageId"] ?? 0;
        $this->userId = (int)$associative["UserId"] ?? 0;
        $this->commentValue = $associative["CommentValue"] ?? "";
        $this->isRemoved = (bool)$associative["IsRemoved"] ?? false;
    }

    public function create(): void
    {
        $query = "INSERT INTO Comments (ImageId, UserId, CommentValue)";
        $query .= " VALUES (?, ?, ?)";

        $this->query($query, "iis", $this->imageId, $this->userId, $this->commentValue);
    }

    public function getAll(): array
    {
        $query = "SELECT * FROM Comments AS C ORDER BY C.CommentId DESC";

        return $this->mapFrom($query, Comment::class);
    }

    public function getById()
    {
        $query = "SELECT * FROM Comments WHERE CommentId = ?";

        return new Comment(
            $this->query($query, "i", $this->commentId)
                ->get_result()
                ->fetch_assoc()
        );
    }

    public function getByImage(): array
    {
        $query = "SELECT *";
        $query .= " FROM Comments AS C";
        $query .= " WHERE ImageId =";
        $query .= " $this->imageId";
        $query .= " ORDER BY C.CommentId DESC";

        return $this->mapFrom($query, Comment::class);
    }

    public function update(): void
    {
        $query = "UPDATE Comments SET CommentValue = ? WHERE CommentId = ?";

        $this->query($query, "si", $this->commentValue, $this->commentId);
    }

    public function delete(): void
    {
        $query = "DELETE FROM Comments WHERE CommentId = ?";

        $this->query($query, "i", $this->commentId);
    }
}
