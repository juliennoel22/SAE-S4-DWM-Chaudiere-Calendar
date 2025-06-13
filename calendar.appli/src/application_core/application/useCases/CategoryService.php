<?php

namespace calendar\core\application_core\application\useCases;

use calendar\core\application_core\application\entities\Category;
use calendar\core\application_core\application\exceptions\CategoryException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;

class CategoryService implements CategoryServiceInterface
{
    
    public function createCategory(string $label, string $description): int
    {
        if (trim($label) === '') {
            throw new CategoryException("Le nom de la catégorie est obligatoire");
        }
        $existing = Category::whereRaw('LOWER(label) = ?', [strtolower(trim($label))])->first();
        if ($existing) {
            throw new CategoryException("Une catégorie avec ce nom existe déjà");
        }
        
        try {
            $category = new Category();
            $category->label = htmlspecialchars($label, ENT_QUOTES, 'UTF-8');
            $category->description = htmlspecialchars($description ?? '', ENT_QUOTES, 'UTF-8');
            $category->created_at = date('Y-m-d H:i:s');
            $category->save();
            
            return $category->id;
        } catch (QueryException $e) {
            throw new CategoryException("Erreur lors de la création de la catégorie: " . $e->getMessage());
        }
    }
    
    public function getAllCategories(): array
    {
        try {
            return Category::all()->toArray();
        } catch (QueryException $e) {
            throw new CategoryException("Erreur lors de la récupération des catégories: " . $e->getMessage());
        }
    }
    
    public function getCategoryById(int $categoryId): array
    {
        try {
            $category = Category::findOrFail($categoryId);
            return $category->toArray();
        } catch (ModelNotFoundException $e) {
            throw new CategoryException("Catégorie avec l'ID $categoryId non trouvée");
        } catch (QueryException $e) {
            throw new CategoryException("Erreur lors de la récupération de la catégorie: " . $e->getMessage());
        }
    }
}
