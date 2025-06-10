<?php


declare(strict_types=1);
use calendar\core\webui\actions\HomeAction;

return function ($app): object {
    

    $app->get('/{route:|home}', HomeAction::class)->setName('home');

    return $app;
};
