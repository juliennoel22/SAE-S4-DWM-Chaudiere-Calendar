<?php

declare(strict_types=1);

namespace calendar\core\application_core\application\useCases;

interface AuthnServiceInterface
{
    public function signin(string $userId, string $password): array;
}