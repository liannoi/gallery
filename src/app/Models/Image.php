<?php

declare(strict_types=1);

namespace App\Models;

class Image extends ActiveRecord
{
    public int $imageId;
    public int $userId;
    public string $path;
    public string $title;
    public ?string $takenDate;
    public string $uploadedDate;
    public bool $isRemoved;

    public function __construct(array $associative = array())
    {
        parent::__construct();
        $this->imageId = (int)$associative["ImageId"] ?? 0;
        $this->userId = (int)$associative["UserId"] ?? 0;
        $this->path = $associative["Path"] ?? "";
        $this->title = $associative["Title"] ?? "";
        $this->takenDate = $associative["TakenDate"] ?? null;
        $this->uploadedDate = $associative["UploadedDate"] ?? date('Y-m-d H:i:s');
        $this->isRemoved = (bool)$associative["IsRemoved"] ?? false;
    }

    public function create(): void
    {
        $query = "INSERT INTO Images (UserId, Path, Title, TakenDate, UploadedDate) VALUES (?, ?, ?, ?, ?)";

        $this->query($query, "issss", $this->userId, $this->path, $this->title, $this->takenDate, $this->uploadedDate);
    }

    public function getAll(): array
    {
        $query = "SELECT * FROM Images";

        return $this->mapFrom($query, Image::class);
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
        $query = "DELETE FROM Images WHERE ImageId = ?";

        $this->query($query, "i", $this->imageId);
    }
}
