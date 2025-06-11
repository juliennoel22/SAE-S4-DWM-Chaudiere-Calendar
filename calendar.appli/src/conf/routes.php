<?php


declare(strict_types=1);
use calendar\core\webui\actions\ApiCategoryListAction;
use calendar\core\webui\actions\ApiEventDetailAction;
use calendar\core\webui\actions\ApiEventListAction;
use calendar\core\webui\actions\ApiEventListByCategoryAction;
use calendar\core\webui\actions\EventCreateAction;
use calendar\core\webui\actions\EventListAction;

use calendar\core\webui\actions\EventListByCategoryAction;
use calendar\core\webui\actions\EventTogglePublishAction;
use calendar\core\webui\actions\HomeAction;
use calendar\core\webui\actions\GetSignInFormAction;
use calendar\core\webui\actions\SignInAction;
use calendar\core\webui\actions\DisplayCategoryFormAction;
use calendar\core\webui\actions\CreateCategoryAction;
use calendar\core\webui\actions\DisplayCategoriesAction;
use calendar\core\webui\actions\LogoutAction;
use calendar\core\webui\actions\UserCreateAction;


return function ($app): object {

    $app->get('/{route:|home}', HomeAction::class)->setName('home');
    $app->get('/logout', LogoutAction::class)->setName('logout');

    $app->get('/events', EventListAction::class)->setName('events');
    $app->map(['GET', 'POST'], '/events/create', EventCreateAction::class)->setName('eventCreate');
    $app->post('/events/{id}/toggle-publish', EventTogglePublishAction::class)->setName('event_toggle_publish');

    $app->get('/signin', GetSignInFormAction::class)->setName('signin_get');
    $app->post('/signin', SignInAction::class)->setName('signin_post');

    $app->get('/create/category', DisplayCategoryFormAction::class)->setName('create_category_form');
    $app->post('/create/category', CreateCategoryAction::class)->setName('create_category_post');


    $app->get('/api/category', ApiCategoryListAction::class);
    $app->get('/api/events', ApiEventListAction::class);
    $app->get('/api/category/{id}/event', ApiEventListByCategoryAction::class);
    $app->get('/api/event/{id}', ApiEventDetailAction::class);

    $app->map(['GET', 'POST'], '/users/create', UserCreateAction::class)->setName('user_create');
    return $app;
};
