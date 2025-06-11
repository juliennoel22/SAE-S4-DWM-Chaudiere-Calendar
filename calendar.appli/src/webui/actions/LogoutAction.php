<?php

namespace calendar\core\webui\actions;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class LogoutAction
{
    public function __invoke(Request $request, Response $response, array $args): Response
    {
        // Détruit la session de façon sécurisée
        session_unset();
        session_destroy();

        // Redirige vers la page d'accueil
        return $response
            ->withHeader('Location', '/')
            ->withStatus(302);
    }
}