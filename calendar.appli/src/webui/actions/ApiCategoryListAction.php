<?php


namespace calendar\core\webui\actions;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use calendar\core\application_core\application\useCases\CategoryService;

class ApiCategoryListAction
{
    private CategoryService $categoryService;

    public function __construct()
    {
        $this->categoryService = new CategoryService();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        $categories = $this->categoryService->getAllCategories();
        $payload = json_encode($categories);

        $response->getBody()->write($payload);
        return $response->withHeader('Content-Type', 'application/json');
    }
}