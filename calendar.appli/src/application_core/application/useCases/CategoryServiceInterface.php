<?php

namespace calendar\core\application_core\application\useCases;

interface CategoryServiceInterface
{
    public function createCategory(string $label, string $description): int;
    public function getAllCategories(): array;
    public function getCategoryById(int $categoryId): array;
}
