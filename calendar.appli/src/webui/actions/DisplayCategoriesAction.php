<?php

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\entities\Category;
use calendar\core\application_core\application\exceptions\CategoryException;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpInternalServerErrorException;
use Slim\Views\Twig;

class DisplayCategoriesAction
{
    public function __construct() {}

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        if (!isset($_SESSION['user'])) {
            throw new HttpNotFoundException($request, "Vous devez être connecté pour accéder à cette page");
        }
        $categories = Category::all();
        
        $twig = Twig::fromRequest($request);
        return $twig->render($response, 'categories.html.twig', [
            'categories' => $categories
        ]);
    }
}
