<?php


namespace calendar\core\webui\actions;

use calendar\core\application_core\application\useCases\EventServiceInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use calendar\core\application_core\application\useCases\EventService;

class EventTogglePublishAction
{
    private EventServiceInterface $eventService;

    public function __construct()
    {
        $this->eventService = new EventService();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        $eventId = (int)($args['id'] ?? 0);
        $this->eventService->togglePublish($eventId);

        return $response
            ->withHeader('Location', '/events')
            ->withStatus(302);
    }
}