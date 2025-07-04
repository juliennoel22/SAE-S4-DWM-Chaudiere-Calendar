<?php

declare(strict_types=1);

use calendar\core\webui\middleware\CorsMiddleware;
use Slim\Factory\AppFactory;
use calendar\core\utils\Eloquent;
use Slim\Views\Twig;
use Slim\Views\TwigMiddleware;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpBadRequestException;
use Slim\Exception\HttpNotFoundException;
use Slim\Exception\HttpForbiddenException;
use Slim\Exception\HttpInternalServerErrorException;

// Charger Eloquent avec le fichier de configuration
Eloquent::init(__DIR__ . '/calendar.db.conf.ini');

// Initialiser Twig
$twig = Twig::create(
    __DIR__ . '/../webui/views/',
    [    'auto_reload' => true]
);

// Créer l'application Slim
$app = AppFactory::create();

// Ajouter Twig comme middleware
$app->add(TwigMiddleware::create($app, $twig));

// Définir dynamiquement le base path
$scriptName = str_replace('\\', '/', dirname($_SERVER['SCRIPT_NAME']));
$app->setBasePath(rtrim($scriptName, '/'));

// Ajouter le middleware d'erreur
$errorMiddleware = $app->addErrorMiddleware(true, true, true);

$app->add(new CorsMiddleware);

// 400 Bad Request
$errorMiddleware->setErrorHandler(
    HttpBadRequestException::class,
    function (Request $request, Throwable $exception) use ($app) {
        $response = $app->getResponseFactory()->createResponse();
        $view = Twig::fromRequest($request);
        return $view->render($response->withStatus(400), 'error.twig', [
            'message' => $exception->getMessage() ?: 'Requête invalide'
        ]);
    }
);

// 404 Not Found
$errorMiddleware->setErrorHandler(
    HttpNotFoundException::class,
    function (Request $request, Throwable $exception) use ($app) {
        $response = $app->getResponseFactory()->createResponse();
        $view = Twig::fromRequest($request);
        return $view->render($response->withStatus(404), 'error.twig', [
            'message' => $exception->getMessage() ?: 'Page non trouvée'
        ]);
    }
);

// 403 Forbidden
$errorMiddleware->setErrorHandler(
    HttpForbiddenException::class,
    function (Request $request, Throwable $exception) use ($app) {
        $response = $app->getResponseFactory()->createResponse();
        $view = Twig::fromRequest($request);
        return $view->render($response->withStatus(403), 'error.twig', [
            'message' => $exception->getMessage() ?: 'Accès interdit'
        ]);
    }
);

// 500 Internal Server Error
$errorMiddleware->setErrorHandler(
    HttpInternalServerErrorException::class,
    function (Request $request, Throwable $exception) use ($app) {
        $response = $app->getResponseFactory()->createResponse();
        $view = Twig::fromRequest($request);
        return $view->render($response->withStatus(500), 'error.twig', [
            'message' => $exception->getMessage() ?: 'Erreur interne du serveur'
        ]);
    }
);

// Autre erreurs
$errorMiddleware->setDefaultErrorHandler(
    function (Request $request, Throwable $exception) use ($app) {
        $response = $app->getResponseFactory()->createResponse();
        $view = Twig::fromRequest($request);
        return $view->render($response->withStatus(500), 'error.twig', [
            'message' => 'Erreur inattendue : ' . $exception->getMessage()
        ]);
    }
);

// Charger les routes
$app = (require __DIR__ . '/routes.php')($app);

return $app;
