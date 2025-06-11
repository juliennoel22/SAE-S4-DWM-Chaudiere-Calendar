<?php

declare(strict_types=1);

namespace calendar\core\application_core\application\providers;

use calendar\core\application_core\application\usecase\AuthnServiceInterface;

interface AuthnProviderInterface
{
   

    public function signin(string $userId, string $password): void;
}