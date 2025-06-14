<?php

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\CsrfTokenException;
use calendar\core\application_core\application\providers\CsrfTokenProvider;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpForbiddenException;
use Slim\Exception\HttpInternalServerErrorException;
use Slim\Views\Twig;

class DisplayUserFormAction
{
    public function __invoke(Request $request, Response $response, array $args): Response
    {
        if (!isset($_SESSION['user'])) {
            throw new HttpForbiddenException($request, "Vous devez être connecté pour accéder à cette page");
        }
        if (!($_SESSION['is_adm'] ?? false)) {
            throw new HttpForbiddenException($request, "Vous n'avez pas les droits pour accéder à cette page");
        }
        try{
            $csrfToken = CsrfTokenProvider::generate();
            $twig = Twig::fromRequest($request);
            return $twig->render($response, 'create_user_form.twig', [
                'title' => 'Créer un user',
                'csrf_token' => $csrfToken,
                'user' => $_SESSION['user'] ?? null,
                'is_superadmin' => $_SESSION['is_adm']
            ]);
            }catch (CsrfTokenException $e){
                throw new HttpInternalServerErrorException($request, $e->getMessage());
            }
        }
    }