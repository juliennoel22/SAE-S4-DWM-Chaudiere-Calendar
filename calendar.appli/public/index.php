<?php

declare(strict_types=1);

use \calendar\core\application_core\middleware\CorsMiddleware;


require_once __DIR__ . '/../../vendor/autoload.php';
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// je démarre la session si elle est pas déja start
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

/* Application bootstrap */
$app = require_once __DIR__ . '/../src/conf/bootstrap.php';

$app->add(new CorsMiddleware);

// Run the application
$app->run();
