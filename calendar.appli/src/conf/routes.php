<?php


declare(strict_types=1);

use calendar\core\webui\actions\HomeAction;
use calendar\core\webui\actions\DisplayCategoryFormAction;
use calendar\core\webui\actions\CreateCategoryAction;
use calendar\core\webui\actions\DisplayCategoriesAction;

return function ($app): object {

    $app->get('/{route:|home}', HomeAction::class)->setName('home');

    $app->get('/create/category', DisplayCategoryFormAction::class)->setName('create_category_form');
    $app->post('/create/category', CreateCategoryAction::class)->setName('create_category_post');

    return $app;
};
