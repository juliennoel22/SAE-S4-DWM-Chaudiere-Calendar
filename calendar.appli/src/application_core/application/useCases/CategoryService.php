<?php

namespace calendar\core\application_core\application\useCases;

use calendar\core\application_core\application\entities\Category;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;

class CategoryService implements CategoryServiceInterface
{

    public function createCategory(string $label, string $description): int
    {
        try {
            $category = new Category();
            $category->label = $label;
            $category->description = $description ?? '';
            $category->created_at = date('Y-m-d H:i:s');
            $category->save();

            return $category->id;
        } catch (QueryException $e) {
            throw new \Exception("Erreur lors de la création de la catégorie: " . $e->getMessage());
        }
    }

    public function getAllCategories(): array
    {
        try {
            return Category::all()->toArray();
        } catch (QueryException $e) {
            throw new \Exception("Erreur lors de la récupération des catégories: " . $e->getMessage());
        }
    }

    public function getCategoryById(int $categoryId): array
    {
        try {
            $category = Category::findOrFail($categoryId);
            return $category->toArray();
        } catch (ModelNotFoundException $e) {
            throw new \Exception("Catégorie avec l'ID $categoryId non trouvée");
        } catch (QueryException $e) {
            throw new \Exception("Erreur lors de la récupération de la catégorie: " . $e->getMessage());
        }
    }
}
