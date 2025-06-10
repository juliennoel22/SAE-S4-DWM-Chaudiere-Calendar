<?php
namespace calendar\core\webui\actions;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;

class HomeAction
{


    public function __construct() {
        
    }
    public function __invoke(Request $request, Response $response, array $args): Response
    {

    
            $twig = Twig::fromRequest($request);
            
            return $twig->render($response, 'home.twig');
        
    }
}