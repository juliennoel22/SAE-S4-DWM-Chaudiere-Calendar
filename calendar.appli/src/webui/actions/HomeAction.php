<?php

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\entities\Category;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;

class HomeAction
{


    public function __construct() {
        
    }
    public function __invoke(Request $request, Response $response, array $args): Response
    {


        $categories = Category::all();

        // Route parser pour générer l'URL de création de catégorie
        /* 
        
        ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
        je suis pas sur de ca, on peut peut être même la même route uqe dans routes.php !
        ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
        
        */
        $routeParser = $request->getAttribute('routeParser');
        $createCategoryUrl = $routeParser ? $routeParser->urlFor('categoryCreation') : '/create/category';

        $twig = Twig::fromRequest($request);

        return $twig->render($response, 'home.twig', [
            'categories' => $categories,
            'createCategoryUrl' => $createCategoryUrl
        ]);
    }
}