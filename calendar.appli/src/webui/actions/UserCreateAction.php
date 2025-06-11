<?php


namespace calendar\core\webui\actions;

use calendar\core\application_core\application\useCases\UserServiceInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use calendar\core\application_core\application\useCases\UserService;
use Slim\Views\Twig;
class UserCreateAction
{
    
    private UserServiceInterface $userService;

    public function __construct()
    {
        $this->userService = new UserService();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        if (!isset($_SESSION['user'])) {
            throw new HttpNotFoundException($request, "Vous devez être connecté pour accéder à cette page");
        }
        $twig = Twig::fromRequest($request);
        // echo $_SESSION["id_a"]
        // Vérifier que l'utilisateur courant est super-admin (à adapter selon ton auth)
        if (!($_SESSION['is_adm'] ?? false)) {
            return $response->withStatus(403);
        }

        if ($request->getMethod() === 'POST') {
            $data = $request->getParsedBody();
            $this->userService->createUser($data['email'], $data['password']);
            return $response->withHeader('Location', '/categories')->withStatus(302);
        }

        return $twig->render($response, 'user_create.twig');
    }
}