<?php
namespace calendar\core\webui\actions;

use  calendar\core\application_core\application\useCases\EventService;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;
use  calendar\core\application_core\application\useCases\EventServiceInterface;


class EventListAction
{
    private EventServiceInterface $eventService;

    public function __construct()
    {
        $this->eventService = new EventService();
    }

    public function __invoke(Request $request, Response $response, array $args): Response
    {
        $twig = Twig::fromRequest($request);

        $events = $this->eventService->getEvents();

        return $twig->render($response, 'list.twig', [
            'events' => $events
        ]);
    }
}