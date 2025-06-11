<?php


namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\EventServiceException;
use calendar\core\application_core\application\useCases\CategoryServiceInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use calendar\core\application_core\application\useCases\CategoryService;
use Slim\Exception\HttpBadRequestException;
use Slim\Exception\HttpInternalServerErrorException;

class ApiCategoryListAction
{
    private CategoryServiceInterface $categoryService;

    public function __construct()
    {
        $this->categoryService = new CategoryService();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        $user = $_SESSION['user'] ?? null;
        if (!$user) {
            throw new HttpUnauthorizedException($request, "Vous devez être connecté pour accéder à cette page.");
        }
        try{
            $categories = $this->categoryService->getAllCategories();
            $payload = json_encode($categories);
    
            $response->getBody()->write($payload);
            return $response->withHeader('Content-Type', 'application/json');

        }catch (EventServiceException $e) {
            throw new HttpInternalServerErrorException($request, $e->getMessage());
        }
    }
}