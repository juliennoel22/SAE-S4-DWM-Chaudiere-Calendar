<?php

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\CsrfTokenException;
use calendar\core\application_core\application\exceptions\EventServiceException;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpInternalServerErrorException;
use Slim\Exception\HttpForbiddenException;
use Slim\Views\Twig;
use calendar\core\application_core\application\useCases\EventServiceInterface;
use calendar\core\application_core\application\useCases\EventService;
use calendar\core\application_core\application\useCases\CategoryServiceInterface;
use calendar\core\application_core\application\useCases\CategoryService;
use calendar\core\application_core\application\providers\CsrfTokenProvider;
use League\CommonMark\CommonMarkConverter;

class DisplayEventFormAction
{
    private CategoryServiceInterface $categoryService;
    
    function __construct(){
        $this->categoryService = new CategoryService();
    }
    
    public function __invoke(Request $request, Response $response, array $args): Response
    {
        if (!isset($_SESSION['user'])) {
            throw new HttpForbiddenException($request, "Vous devez être connecté pour accéder à cette page");
        }
        try{
            $csrfToken = CsrfTokenProvider::generate();
            $twig = Twig::fromRequest($request);
            $categories = $this->categoryService->getAllCategories();
            return $twig->render($response, 'create_event_form.twig', [
                'title' => 'Créer un evenement',
                'categories' => $categories,
                'csrf_token' => $csrfToken,
                'user' => $_SESSION['user'] ?? null
            ]);
        }catch (CsrfTokenException $e){
            throw new HttpInternalServerErrorException($request, $e->getMessage());
        }
    }
}