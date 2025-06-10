<?php

declare(strict_types=1);

use Slim\Factory\AppFactory;
use calendar\core\utils\Eloquent;
use Slim\Views\Twig;
use Slim\Views\TwigMiddleware;

// Charger Eloquent avec le fichier de configuration
Eloquent::init(__DIR__ . '/calendar.db.conf.ini');

// Initialiser Twig
$twig = Twig::create(__DIR__ . '/../webui/views/', [
    'cache' => __DIR__ . '/../webui/views/cache',
    'auto_reload' => true
]);

// Créer l'application Slim
$app = AppFactory::create();

// Ajouter Twig comme middleware
$app->add(TwigMiddleware::create($app, $twig));

// Définir dynamiquement le base path
$scriptName = str_replace('\\', '/', dirname($_SERVER['SCRIPT_NAME']));
$app->setBasePath(rtrim($scriptName, '/'));

// Ajouter le middleware d'erreur
$errorMiddleware = $app->addErrorMiddleware(true, true, true);

// Charger les routes
$app = (require __DIR__ . '/routes.php')($app);

return $app;
