<?php

declare(strict_types=1);

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\UserNotFoundException;
use calendar\core\application_core\application\exceptions\AuthnException;
use calendar\core\application_core\application\providers\AuthnProviderInterface;
use calendar\core\application_core\application\providers\AuthnProvider;
use calendar\core\application_core\application\exceptions\ProviderInternalErrorException;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;      
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
            $data = $request->getParsedBody();
            $this->authnProvider->signin($data['email'], $data['password']);

            $view = Twig::fromRequest($request);

            return $response
                ->withHeader('Location', '../')
                ->withStatus(302);
        
        } catch (UserNotFoundException $e) {
            $view = Twig::fromRequest($request);
            return $view->render($response, 'form_signin.twig', [
                'error' => 'Utilisateur introuvable'
            ]);
        } catch (AuthnException $e){
            $view = Twig::fromRequest($request);
            return $view->render($response, 'form_signin.twig', [
                'error' => 'Mot de passe incorrect'
            ]);
        } catch (ProviderInternalErrorException $e){
            $view = Twig::fromRequest($request);
            return $view->render($response, 'form_signin.twig', [
                'error' => 'Erreur interne, veuillez réessayer plus tard'
            ]);
        }
    }
}
