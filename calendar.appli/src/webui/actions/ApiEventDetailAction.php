<?php


namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\EventServiceException;
use calendar\core\application_core\application\useCases\EventServiceInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use calendar\core\application_core\application\useCases\EventService;
use Slim\Exception\HttpInternalServerErrorException;

class ApiEventDetailAction
{
    private EventServiceInterface $eventService;

    public function __construct()
    {
        $this->eventService = new EventService();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {

        try {
            $eventId = (int) ($args['id'] ?? 0);
            $event = $this->eventService->getEventDetailForApi($eventId);
            $response->getBody()->write(json_encode($event));
            return $response->withHeader('Content-Type', 'application/json');
        } catch (EventServiceException $e) {
            throw new HttpInternalServerErrorException($request, $e->getMessage());
        }
    }
}