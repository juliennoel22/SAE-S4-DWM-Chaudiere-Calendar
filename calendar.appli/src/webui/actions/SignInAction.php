<?php

declare(strict_types=1);

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\UserNotFoundException;
use calendar\core\application_core\application\exceptions\AuthnException;
use calendar\core\application_core\application\providers\AuthnProviderInterface;
use calendar\core\application_core\application\providers\AuthnProvider;
use calendar\core\application_core\application\providers\CsrfTokenProvider;
use calendar\core\application_core\application\exceptions\ProviderInternalErrorException;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use Slim\Exception\HttpForbiddenException;
use Slim\Views\Twig;

class SignInAction {
    private AuthnProviderInterface $authnProvider;

    public function __construct()
    {
        $this->authnProvider = new AuthnProvider();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        try {
            // Si déjà connecté, on interdit l'accès à la page de connexion
            if (isset($_SESSION['user'])) {
                throw new HttpForbiddenException($request, "Vous ne devez pas être connecté pour accéder à cette page");
            }

            $data = $request->getParsedBody();
            CsrfTokenProvider::check($data['csrf'] ?? '');

            $this->authnProvider->signin($data['email'], $data['password']);

            // Redirection vers la page d'accueil après connexion réussie
            return $response
                ->withHeader('Location', '/')
                ->withStatus(302);

        } catch (UserNotFoundException $e) {
            $view = Twig::fromRequest($request);
            $csrfToken = CsrfTokenProvider::generate();
            return $view->render($response, 'signin_form.twig', [
                'error' => 'Utilisateur introuvable',
                'csrf_token' => $csrfToken,
                'user' => null
            ]);
        } catch (AuthnException $e) {
            $view = Twig::fromRequest($request);
            $csrfToken = CsrfTokenProvider::generate();
            return $view->render($response, 'signin_form.twig', [
                'error' => 'Mot de passe incorrect',
                'csrf_token' => $csrfToken,
                'user' => null
            ]);
        } catch (ProviderInternalErrorException $e) {
            $view = Twig::fromRequest($request);
            $csrfToken = CsrfTokenProvider::generate();
            return $view->render($response, 'signin_form.twig', [
                'error' => 'Erreur interne, veuillez réessayer plus tard',
                'csrf_token' => $csrfToken,
                'user' => null
            ]);
        }
    }
}
