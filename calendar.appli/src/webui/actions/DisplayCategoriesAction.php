<?php

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\entities\Category;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;

class DisplayCategoriesAction
{
    public function __construct() {}

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        $categories = Category::all();
        
        $twig = Twig::fromRequest($request);
        return $twig->render($response, 'categories.html.twig', [
            'categories' => $categories
        ]);
    }
}
