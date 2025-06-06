<?php
 namespace App\conf;
 
// use Slim\App;
// use App\controllers\EventController;

// return function (App $app): App {
//     $app->get('/api/events', [EventController::class, 'getAll']);
//     $app->get('/admin', [EventController::class, 'renderAdmin']);
//     return $app;
// };

// // return function (App $app) {
// //     $app->get('/', function (Request $request, Response $response) {
// //         $response->getBody()->write("Page d'accueil");
// //         return $response;
// //     });

// //     // Exemple d'une route avec Twig
// //     $app->get('/', function (Request $request, Response $response, $args) use ($app) {
// //         $view = \Slim\Views\Twig::fromRequest($request);
// //         return $view->render($response, 'home.twig', []);
// //     });
// // };

use Slim\Psr7\Request;
use Slim\Psr7\Response;
use Slim\App;
use App\controllers\EventController;

return function (App $app): App {

    
    $app->get('/', function ($request, $response) {
        return $response->withHeader('Location', '/home')->withStatus(302);
    });
    
    $app->get('/home', [EventController::class, 'renderHome']);
    
    $app->get('/admin', [EventController::class, 'renderAdmin'])->setName('admin');
    $app->get('/api/events', [EventController::class, 'getAll'])->setName('events_list');

    return $app;
    // $app->get('/', function (Request $request, Response $response) use ($app) {
    //     $view = \Slim\Views\Twig::fromRequest($request);
    //     // $routeParser = $app->getRouteCollector()->getRouteParser();
    
    //     return $view->render($response, 'home.html.twig');
    //     // , [
    //     //     'urls' => [
    //     //         'home' => $routeParser->urlFor('home'),
    //     //         'admin' => $routeParser->urlFor('admin'),
    //     //         'events_list' => $routeParser->urlFor('events_list'),
    //     //     ]
    //     // ]);
    // })->setName('home');
};
