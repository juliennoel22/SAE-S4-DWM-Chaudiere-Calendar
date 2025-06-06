<?php

declare(strict_types=1);

namespace App\conf;

use Slim\Factory\AppFactory;
use App\infra\Eloquent;
use Slim\Views\Twig;
use Slim\Views\TwigMiddleware;

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Initialise la connexion à la BDD avec le fichier conf.ini
Eloquent::init(__DIR__ . '/conf.ini');

// Crée l'application Slim
$app = AppFactory::create();

// Si ton application est accessible via http://localhost/Calendar, définis le basePath comme suit
// Sinon, supprime cette ligne
$app->setBasePath('/Calendar');

// Configuration Twig : dossier des templates
$twig = Twig::create(__DIR__ . '/../templates', ['cache' => false]);

// Ajoute les middlewares nécessaires
$app->addRoutingMiddleware();
$app->add(TwigMiddleware::create($app, $twig));

// Charge les routes depuis routes.php
$routes = require_once __DIR__ . '/routes.php';
$app = $routes($app);

// Middleware pour gérer les erreurs et afficher les détails (à désactiver en prod)
$app->addErrorMiddleware(true, true, true);

return $app;
