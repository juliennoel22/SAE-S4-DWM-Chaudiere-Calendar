<?php

declare(strict_types=1);
use calendar\core\webui\actions\ApiCategoryListAction;
use calendar\core\webui\actions\ApiEventDetailAction;
use calendar\core\webui\actions\ApiEventListAction;
use calendar\core\webui\actions\ApiEventListByCategoryAction;
use calendar\core\webui\actions\CategoriesAction;
use calendar\core\webui\actions\EventListAction;
use calendar\core\webui\actions\EventTogglePublishAction;
use calendar\core\webui\actions\GetSignInFormAction;
use calendar\core\webui\actions\SignInAction;
use calendar\core\webui\actions\DisplayCategoryFormAction;
use calendar\core\webui\actions\CreateCategoryAction;
use calendar\core\webui\actions\CreateEventAction;
use calendar\core\webui\actions\CreateUserAction;
use calendar\core\webui\actions\DisplayEventFormAction;
use calendar\core\webui\actions\DisplayUserFormAction;
use calendar\core\webui\actions\RedirectAction;
use calendar\core\webui\actions\LogoutAction;
use calendar\core\webui\actions\EventDetailsAction;
use calendar\core\webui\actions\HomeAction;

return function ($app): object {
    $app->get('/', RedirectAction::class)->setName('redirect');
    $app->get('/home', HomeAction::class)->setName('home');
    $app->get('/logout', LogoutAction::class)->setName('logout');

    $app->get('/signin', GetSignInFormAction::class)->setName('signin_get');
    $app->post('/signin', SignInAction::class)->setName('signin_post');

    $app->get('/categories', CategoriesAction::class)->setName('categories');
    $app->get('/events', EventListAction::class)->setName('events');
  
    $app->get('/events/{id}', EventDetailsAction::class)->setName('event_detail');

    $app->post('/events/{id}/toggle-publish', EventTogglePublishAction::class)->setName('event_toggle_publish');

    $app->get('/create/event', DisplayEventFormAction::class)->setName('create_event_form');////
    $app->post('/create/event', CreateEventAction::class)->setName('create_event_post');///
    
    $app->get('/create/user', DisplayUserFormAction::class)->setName('create_user_form');////
    $app->post('/create/user', CreateUserAction::class)->setName('create_user_form');////

    $app->get('/create/category', DisplayCategoryFormAction::class)->setName('create_category_form');
    $app->post('/create/category', CreateCategoryAction::class)->setName('create_category_post');

    $app->get('/api/category', ApiCategoryListAction::class);
    $app->get('/api/events', ApiEventListAction::class);
    $app->get('/api/category/{id}/event', ApiEventListByCategoryAction::class);
    $app->get('/api/evenements/{id}', ApiEventDetailAction::class);

  
    return $app;
};
