<?php


namespace calendar\core\webui\actions;

use Slim\Exception\HttpForbiddenException;
use calendar\core\application_core\application\exceptions\EventServiceException;
use calendar\core\application_core\application\useCases\EventServiceInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use calendar\core\application_core\application\useCases\EventService;
use Slim\Exception\HttpInternalServerErrorException;

class EventTogglePublishAction
{
    private EventServiceInterface $eventService;

    public function __construct()
    {
        $this->eventService = new EventService();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        if (!isset($_SESSION['user'])) {
            throw new HttpForbiddenException($request, "Vous devez être connecté pour accéder à cette page");
        }
        try{
            $eventId = (int)($args['id'] ?? 0);
            $this->eventService->togglePublish($eventId);
        }catch(EventServiceException $e){
           throw new HttpInternalServerErrorException($request, $e->getMessage());
        }

        return $response
            ->withHeader('Location', '/events')
            ->withStatus(302);
    }
}