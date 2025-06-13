<?php

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\CategoryException;
use calendar\core\application_core\application\exceptions\CsrfTokenException;
use calendar\core\application_core\application\useCases\CategoryService as ServicesCategoryService;
use calendar\core\application_core\application\useCases\CategoryServiceInterface as ServicesCategoryServiceInterface;
use calendar\core\application_core\application\providers\CsrfTokenProvider;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpBadRequestException;
use Slim\Exception\HttpInternalServerErrorException;
use Slim\Exception\HttpForbiddenException;

class CreateCategoryAction
{
    private ServicesCategoryServiceInterface $categoryService;
    
    public function __construct()
    {
        $this->categoryService = new ServicesCategoryService();
    }
    
    public function __invoke(Request $request, Response $response, array $args): Response
    {
        if (!isset($_SESSION['user'])) {
            throw new HttpForbiddenException($request, "Vous devez être connecté pour accéder à cette page");
        }
        
        // Récupérer les données du formulaire
        $data = $request->getParsedBody();
        
        // echo $data['csrf'];
        
        $label = $data['label'] ?? null; 
        if (empty($label)) {
            throw new HttpBadRequestException($request, "Le label de la catégorie est obligatoire");
        }
        $description = $data['description'] ?? null;
        
        try {
            CsrfTokenProvider::check($data['csrf'] ?? '');
            // Créer la catégorie
            $this->categoryService->createCategory($label, $description);
            
            // Message de succès
            $_SESSION['message'] = "La catégorie a été créée avec succès";
            
            // Rediriger vers la page 
            return $response
            ->withHeader('Location', '/categories')
            ->withStatus(302);
        } catch (CategoryException $e) {
            throw new HttpInternalServerErrorException($request, $e->getMessage());
        } catch (CsrfTokenException $e) {
            throw new HttpForbiddenException($request, $e->getMessage());
        }
        
        
    }
}
