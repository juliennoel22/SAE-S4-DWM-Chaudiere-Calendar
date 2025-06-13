<?php

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\CategoryException;
use calendar\core\application_core\application\useCases\CategoryService;
use calendar\core\application_core\application\useCases\CategoryServiceInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpForbiddenException;
use Slim\Exception\HttpInternalServerErrorException;
use Slim\Views\Twig;

class CategoriesAction
{

    private CategoryServiceInterface $categorieService;
    public function __construct() {
        $this->categorieService = new CategoryService();
    }
    public function __invoke(Request $request, Response $response, array $args): Response
    {
        if (!isset($_SESSION['user'])) {
            throw new HttpForbiddenException($request, "Vous devez être connecté pour accéder à cette page");
        }
        try{
            $categories = $this->categorieService->getAllCategories();

            $routeParser = $request->getAttribute('routeParser');
            $createCategoryUrl = $routeParser ? $routeParser->urlFor('categoryCreation') : '/create/category';

            $twig = Twig::fromRequest($request);

            return $twig->render($response, 'categories.twig', [
                'categories' => $categories,
                'createCategoryUrl' => $createCategoryUrl,
                'is_superadmin' => $_SESSION['is_adm'] ?? false

            ]);
        }catch(CategoryException $e){
             throw new HttpInternalServerErrorException($request, $e->getMessage());
        }  
    }
}
