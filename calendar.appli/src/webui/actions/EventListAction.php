<?php

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\useCases\EventService;
use calendar\core\application_core\application\useCases\EventServiceInterface;
use calendar\core\application_core\application\useCases\CategoryServiceInterface;
use calendar\core\application_core\application\useCases\CategoryService;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;

class EventListAction
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
        $twig = Twig::fromRequest($request);

        $params = $request->getQueryParams();
        $categoryId = isset($params['category_id']) ? (int)$params['category_id'] : null;

        $categories = $this->categoryService->getAllCategories();

        if ($categoryId) {
            $events = $this->eventService->getEventsByCategory($categoryId);
        } else {
            $events = $this->eventService->getEvents();
        }

        return $twig->render($response, 'list.twig', [
            'events' => $events,
            'categories' => $categories,
            'selectedCategory' => $categoryId
        ]);
    }
}