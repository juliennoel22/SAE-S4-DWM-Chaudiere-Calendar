<?php

declare(strict_types=1);

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\UserNotFoundException;
use calendar\core\application_core\application\exceptions\AuthnException;
use calendar\core\application_core\application\exceptions\CsrfTokenException;
use calendar\core\application_core\application\providers\AuthnProviderInterface;
use calendar\core\application_core\application\providers\AuthnProvider;
use calendar\core\application_core\application\providers\CsrfTokenProvider;
use calendar\core\application_core\application\exceptions\ProviderInternalErrorException;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use Slim\Exception\HttpForbiddenException;
use Slim\Exception\HttpInternalServerErrorException;
use Slim\Views\Twig;

class SignInAction {
    private AuthnProviderInterface $authnProvider;
    
    public function __construct()
    {
        $this->authnProvider = new AuthnProvider();
    }
    
    private function renderFormWithError(Request $request, Response $response, string $error): Response
    {//Fonction pour regénérer le token et gérer les erreurs
        $view = Twig::fromRequest($request);
        try {
            $csrfToken = CsrfTokenProvider::generate();
            
            return $view->render($response, 'signin_form.twig', [
                'error' => $error,
                'csrf_token' => $csrfToken,
                'user' => null
            ]);
        } catch (CsrfTokenException $e) {
            throw new HttpInternalServerErrorException($request, $e->getMessage());
        } 
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
            
        } catch (CsrfTokenException $e) {
            return $this->renderFormWithError($request, $response, 'Session expirée ou formulaire invalide, veuillez réessayer');
        }catch (UserNotFoundException $e) {
            return $this->renderFormWithError($request, $response, 'Utilisateur introuvable');
        } catch (AuthnException $e) {
            return $this->renderFormWithError($request, $response, 'Mot de passe incorrect');
        } catch (ProviderInternalErrorException $e) {
            return $this->renderFormWithError($request, $response, 'Erreur interne, veuillez réessayer plus tard');
        }
    }
}
