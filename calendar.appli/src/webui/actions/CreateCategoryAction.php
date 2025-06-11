<?php

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\useCases\CategoryService as ServicesCategoryService;
use calendar\core\application_core\application\useCases\CategoryServiceInterface as ServicesCategoryServiceInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpBadRequestException;
use Slim\Exception\HttpInternalServerErrorException;

class CreateCategoryAction
{
    private ServicesCategoryServiceInterface $categoryService;

    public function __construct()
    {
        $this->categoryService = new ServicesCategoryService();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        $method = $request->getMethod();

        // Récupérer les données du formulaire
        $data = $request->getParsedBody();
        $label = $data['label'] ?? null; // normalement le label est obligatoire, mais je mets une sécu
        $description = $data['description'] ?? null;

        try {
            // Créer la catégorie
            $this->categoryService->createCategory($label, $description);

            // Message de succès
            $_SESSION['message'] = "La catégorie a été créée avec succès";

            // Rediriger vers la page home
            return $response
                ->withHeader('Location', '/home')
                ->withStatus(302);
        } catch (\Exception $e) {
            throw new HttpInternalServerErrorException($request, $e->getMessage());
        }

        // Si une autre méthode est utilisée, retourner une erreur
        throw new HttpBadRequestException($request, "Méthode non autorisée");
    }
}
