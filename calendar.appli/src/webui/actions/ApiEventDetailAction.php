<?php


namespace calendar\core\webui\actions;

use calendar\core\application_core\application\useCases\EventServiceInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use calendar\core\application_core\application\useCases\EventService;

class ApiEventDetailAction
{
    private EventServiceInterface $eventService;

    public function __construct()
    {
        $this->eventService = new EventService();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        $eventId = (int)($args['id'] ?? 0);
        $event = $this->eventService->getEventDetailForApi($eventId);

        if (!$event) {
            $response->getBody()->write(json_encode(['error' => 'Not found']));
            return $response->withStatus(404)->withHeader('Content-Type', 'application/json');
        }

        $response->getBody()->write(json_encode($event));
        return $response->withHeader('Content-Type', 'application/json');
    }
}