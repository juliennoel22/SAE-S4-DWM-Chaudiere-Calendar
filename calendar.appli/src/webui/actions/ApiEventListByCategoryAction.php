<?php


namespace calendar\core\webui\actions;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use calendar\core\application_core\application\useCases\EventService;

class ApiEventListByCategoryAction
{
    private EventService $eventService;

    public function __construct()
    {
        $this->eventService = new EventService();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        $categoryId = (int)($args['id'] ?? 0);
        $params = $request->getQueryParams();
        $periode = isset($params['periode']) ? explode(',', $params['periode']) : [];

        $events = $this->eventService->getEventsForApi($periode, $categoryId);

        $payload = json_encode($events);
        $response->getBody()->write($payload);
        return $response->withHeader('Content-Type', 'application/json');
    }
}