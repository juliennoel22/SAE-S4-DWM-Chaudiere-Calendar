<?php

declare(strict_types=1);

namespace calendar\core\webui\actions;

use calendar\core\application_core\application\useCases\EventService;
use calendar\core\application_core\application\exceptions\EventServiceException;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;
use Slim\Exception\HttpNotFoundException;

class EventDetailsAction
{
    private EventService $eventService;

    public function __construct()
    {
        $this->eventService = new EventService();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        try {
            $eventId = (int)($args['id'] ?? 0);
            $event = $this->eventService->getEventById($eventId);

            if (!$event) {
                throw new HttpNotFoundException($request, "Événement non trouvé");
            }

            $view = Twig::fromRequest($request);
            return $view->render($response, 'details_event.twig', [
                'event' => $event,
                'user' => $_SESSION['user'] ?? null,
                'is_superadmin' => $_SESSION['is_adm']
            ]);
        } catch (EventServiceException $e) {
            throw new HttpNotFoundException($request, $e->getMessage());
        }
    }
}