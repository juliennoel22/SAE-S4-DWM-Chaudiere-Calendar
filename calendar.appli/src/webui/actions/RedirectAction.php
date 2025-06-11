<?php

namespace calendar\core\webui\actions;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class RedirectAction
{
    public function __invoke(Request $request, Response $response, array $args): Response
    {
        return $response
            ->withHeader('Location', '/signin')
            ->withStatus(302);
    }
}