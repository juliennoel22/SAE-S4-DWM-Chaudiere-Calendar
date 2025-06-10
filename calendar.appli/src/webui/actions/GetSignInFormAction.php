<?php

declare(strict_types=1);

namespace calendar\core\webui\actions;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;
use Slim\Exception\HttpNotFoundException;

use calendar\core\application_core\application\providers\CsrfTokenProvider;

class GetSignInFormAction
{
    public function __invoke(Request $request, Response $response, array $args): Response
    {
        // Vérification de la présence d'un utilisateur déjà connecté
        if (isset($_SESSION['user'])) {
            throw new HttpNotFoundException($request, "Vous êtes déjà connecté. Veuillez vous déconnecter pour vous connecter avec un autre compte.");
        }
        try {
            $csrfToken = CsrfTokenProvider::generate();
            $view = Twig::fromRequest($request);
            return $view->render($response, 'form_signin.twig', [
                'csrf_token' => $csrfToken,
                'user' => $_SESSION['user'] ?? null
            ]);
        } catch (\Exception $e) {
            throw new HttpNotFoundException($request, "Erreur lors de l'affichage du formulaire de connexion : " . $e->getMessage(), $e);
        }
    }
}