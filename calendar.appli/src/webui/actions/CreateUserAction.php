<?php


namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\CsrfTokenException;
use calendar\core\application_core\application\exceptions\UserServiceException;
use calendar\core\application_core\application\providers\CsrfTokenProvider;
use calendar\core\application_core\application\useCases\UserServiceInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use calendar\core\application_core\application\useCases\UserService;
use Slim\Exception\HttpForbiddenException;
use Slim\Exception\HttpInternalServerErrorException;
use Slim\Exception\HttpNotFoundException;
use Slim\Views\Twig;
class CreateUserAction
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
        // Vérifier que l'utilisateur courant est super-admin 
        if (!($_SESSION['is_adm'] ?? false)) {
            throw new HttpForbiddenException($request, "Vous n'avez pas les droits pour créer un admin");
        }
        $data = $request->getParsedBody();
        
        if (empty($data['email']) || empty($data['password'])) {
            throw new HttpInternalServerErrorException($request, "Email et mot de passe sont requis");
        }
        try{
            CsrfTokenProvider::check($data['csrf'] ?? '');
            $this->userService->createUser($data['email'], $data['password']);
            return $response->withHeader('Location', '/home')->withStatus(302);
        }catch(UserServiceException $e){
            throw new HttpInternalServerErrorException($request, $e->getMessage());
        }catch (CsrfTokenException $e) {
            throw new HttpForbiddenException($request, $e->getMessage());
        }
    }
}