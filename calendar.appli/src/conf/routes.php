<?php


declare(strict_types=1);
use calendar\core\webui\actions\EventListAction;
use calendar\core\webui\actions\HomeAction;
use calendar\core\webui\actions\GetSignInFormAction;
use calendar\core\webui\actions\SignInAction;

return function ($app): object {
    

    $app->get('/{route:|home}', HomeAction::class)->setName('home');
    $app->get('/events', EventListAction::class)->setName('events');
    $app->get('/signin', GetSignInFormAction::class)->setName('signin_get');
    $app->post('/signin', SignInAction::class)->setName('signin_post');

    return $app;
};
