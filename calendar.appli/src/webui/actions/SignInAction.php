<?php

declare(strict_types=1);

namespace calendar\core\webui\actions;
use calendar\core\application_core\application\providers\CsrfTokenProvider;
use calendar\core\application_core\application\providers\AuthnProviderInterface;
use calendar\core\application_core\application\providers\AuthnProvider;
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
            if (!isset($data['email']) || !isset($data['password'])) {
                throw new \InvalidArgumentException("Identifiants manquants.");
            }

            CsrfTokenProvider::check($data['csrf_token'] ?? '');

            $user = $this->authnProvider->signin($data['email'], $data['password']);
            $view = Twig::fromRequest($request);
            return $view->render($response, 'home.twig', [
                'message_accueil' => 'Bienvenue !',
                'user' => $_SESSION['user'] ?? null,
            ]);
        } catch (\Exception $e) {
            // Réponse simple en JSON avec le code et le message d’erreur
            // $status = $e->getCode() >= 400 && $e->getCode() < 600 ? $e->getCode() : 400;
            // $response->getBody()->write(json_encode(['error' => $e->getMessage()]));
            // return $response->withStatus($status)->withHeader('Content-Type', 'application/json');
            $code = $e->getCode();

    // S’assurer que le code est un entier entre 400 et 599, sinon 400
    if (!is_int($code) || $code < 400 || $code >= 600) {
        $code = 400;
    }

    $response->getBody()->write(json_encode(['error' => $e->getMessage()]));
    return $response->withStatus($code)->withHeader('Content-Type', 'application/json');
        }
    }
}