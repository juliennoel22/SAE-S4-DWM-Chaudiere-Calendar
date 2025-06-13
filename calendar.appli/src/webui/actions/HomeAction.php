<?php

namespace calendar\core\webui\actions;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpForbiddenException;
use Slim\Views\Twig;

class HomeAction
{
    public function __invoke(Request $request, Response $response, array $args): Response
    {
         // Vérification de la présence d'un utilisateur déjà connecté
        if (!isset($_SESSION['user'])) {
            throw new HttpForbiddenException($request, "Vous devez être connecté pour accéder à cette page");
        }

        $view = Twig::fromRequest($request);
        return $view->render($response, 'home.twig', [
            'user' => $_SESSION['user'] ?? null,
            'is_superadmin' => $_SESSION['is_adm'] ?? false
        ]);
    }
}