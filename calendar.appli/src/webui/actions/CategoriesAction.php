<?php

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\useCases\CategoryService;
use calendar\core\application_core\application\useCases\CategoryServiceInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;

class CategoriesAction
{

    private CategoryServiceInterface $categorieService;
    public function __construct() {
        $this->categorieService = new CategoryService();
    }
    public function __invoke(Request $request, Response $response, array $args): Response
    {

    
        $categories = $this->categorieService->getAllCategories();

        // Route parser pour générer l'URL de création de catégorie
        /* 
        
        ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
        je suis pas sur de ca, on peut peut être même la même route uqe dans routes.php !
        ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
        
        */
        //echo password_hash('PASSWORD', PASSWORD_DEFAULT);
        $user = $_SESSION['user'] ?? null;
        ///echo isset($_SESSION['user']) ? $_SESSION['user']: "pas d'id";/////
        $routeParser = $request->getAttribute('routeParser');
        $createCategoryUrl = $routeParser ? $routeParser->urlFor('categoryCreation') : '/create/category';

        $twig = Twig::fromRequest($request);

        return $twig->render($response, 'categories.twig', [
            'categories' => $categories,
            'createCategoryUrl' => $createCategoryUrl,
            'user' => $user

        ]);
    
    
    }
}