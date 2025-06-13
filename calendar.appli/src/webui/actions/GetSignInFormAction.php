<?php

declare(strict_types=1);

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\CsrfTokenException;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpForbiddenException;
use calendar\core\application_core\application\providers\CsrfTokenProvider;
use Slim\Exception\HttpInternalServerErrorException;
use Slim\Views\Twig;

class GetSignInFormAction
{
    public function __invoke(Request $request, Response $response, array $args): Response
    {
        // Vérification de la présence d'un utilisateur déjà connecté
        if (isset($_SESSION['user'])) {
            throw new HttpForbiddenException($request, "Vous êtes déjà connecté. Veuillez vous déconnecter pour vous connecter avec un autre compte.");
        }
        try {
            $csrfToken = CsrfTokenProvider::generate();
            $view = Twig::fromRequest($request);
            return $view->render($response, 'signin_form.twig', [
                'csrf_token' => $csrfToken,
                'user' => $_SESSION['user'] ?? null
            ]);
        } catch (CsrfTokenException $e) {
            throw new HttpInternalServerErrorException($request,$e->getMessage());
        }
    }
}