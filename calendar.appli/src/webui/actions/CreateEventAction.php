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
use Slim\Exception\HttpBadRequestException;

class CreateEventAction
{
    private EventServiceInterface $eventService;
    private CategoryServiceInterface $categoryService;
    
    public function __construct()
    {
        $this->eventService = new EventService();
        $this->categoryService = new CategoryService();
    }
    
    public function __invoke(Request $request, Response $response, array $args): Response
    {
        if (!isset($_SESSION['user'])) {
            throw new HttpForbiddenException($request, "Vous devez être connecté pour accéder à cette page");
        }
        $data = $request->getParsedBody();
        if (empty($data['title']) || empty($data['description_md']) || empty($data['date_start']) || empty($data['category_id'])) {
            throw new HttpBadRequestException($request, "Certains champs obligatoires sont manquants.");
        }
        
        try {
            CsrfTokenProvider::check($data['csrf'] ?? '');
            // Convertir le markdown en HTML
            $converter = new CommonMarkConverter();
            $data['description_html'] = $converter->convert($data['description_md']);
            $data['created_by'] = $_SESSION['user_id'] ?? 1; 
            
            $this->eventService->createEvent($data);
            
            return $response
            ->withHeader('Location', '/events')
            ->withStatus(302);
        }
        
        catch (EventServiceException $e) {
            throw new HttpInternalServerErrorException($request, $e->getMessage());
            
        } catch (CsrfTokenException $e) {
            throw new HttpForbiddenException($request, $e->getMessage());
        }
    }
}