<?php

namespace calendar\core\webui\actions;

use Slim\Exception\HttpForbiddenException;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use calendar\core\application_core\application\providers\CsrfTokenProvider;
use Slim\Views\Twig;

class DisplayCategoryFormAction
{
    public function __invoke(Request $request, Response $response, array $args): Response
    {
        if (!isset($_SESSION['user'])) {
            throw new HttpForbiddenException($request, "Vous devez être connecté pour accéder à cette page");
        }
        $csrfToken = CsrfTokenProvider::generate();
        $twig = Twig::fromRequest($request);
        return $twig->render($response, 'category_form.twig', [
            'title' => 'Créer une catégorie',
            'csrf_token' => $csrfToken
        ]);
    }
}
