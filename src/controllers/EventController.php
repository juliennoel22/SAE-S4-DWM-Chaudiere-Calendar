<?php

namespace App\controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use App\models\Event;
use Slim\Views\Twig;

class EventController
{
    public static function getAll(Request $request, Response $response): Response
    {
        $events = Event::all();
        $response->getBody()->write(json_encode($events));
        return $response->withHeader('Content-Type', 'application/json');
    }

    public static function renderAdmin(Request $request, Response $response): Response
    {
        $view = Twig::fromRequest($request);
        return $view->render($response, 'admin.html.twig', [
            'events' => Event::all()
        ]);
    }

    public static function renderHome(Request $request, Response $response): Response
    {
        $view = Twig::fromRequest($request);
        return $view->render($response, 'home.html.twig');
    }
}
