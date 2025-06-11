<?php


namespace calendar\core\webui\actions;

use calendar\core\application_core\application\exceptions\EventServiceException;
use calendar\core\application_core\application\useCases\EventServiceInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use calendar\core\application_core\application\useCases\EventService;
use Slim\Exception\HttpInternalServerErrorException;

class ApiEventListAction
{
    private EventServiceInterface $eventService;

    public function __construct()
    {
        $this->eventService = new EventService();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        if (!isset($_SESSION['user'])) {
            throw new HttpNotFoundException($request, "Vous devez être connecté pour accéder à cette page");
        }
        try{
            $params = $request->getQueryParams();
            $periode = isset($params['periode']) ? explode(',', $params['periode']) : [];
            $sort = $params['sort'] ?? null;

            $events = $this->eventService->getEventsForApi($periode, null, $sort);

            $payload = json_encode($events);
            $response->getBody()->write($payload);
            return $response->withHeader('Content-Type', 'application/json');

        }catch (EventServiceException $e) {
            throw new HttpInternalServerErrorException($request, $e->getMessage());
        }
    }
}