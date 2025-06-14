<?php

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\CsrfTokenException;
use Slim\Exception\HttpForbiddenException;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use calendar\core\application_core\application\providers\CsrfTokenProvider;
use Slim\Exception\HttpInternalServerErrorException;
use Slim\Views\Twig;

class DisplayCategoryFormAction
{
    public function __invoke(Request $request, Response $response, array $args): Response
    {
        if (!isset($_SESSION['user'])) {
            throw new HttpForbiddenException($request, "Vous devez être connecté pour accéder à cette page");
        }
        try{
            $csrfToken = CsrfTokenProvider::generate();
            $twig = Twig::fromRequest($request);
            return $twig->render($response, 'create_category_form.twig', [
                'title' => 'Créer une catégorie',
                'csrf_token' => $csrfToken,
                'user' => $_SESSION['user'] ?? null
            ]);
        }catch (CsrfTokenException $e){
            throw new HttpInternalServerErrorException($request, $e->getMessage());
        }
    }
}
