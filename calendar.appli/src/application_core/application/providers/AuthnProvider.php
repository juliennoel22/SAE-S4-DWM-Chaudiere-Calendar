<?php

declare(strict_types=1);

namespace calendar\core\application_core\application\providers;

use calendar\core\application_core\application\useCases\AuthnServiceInterface;
use calendar\core\application_core\application\useCases\AuthnService;
use calendar\core\application_core\application\exceptions\AuthnException;
use calendar\core\application_core\application\exceptions\UserNotFoundException;

class AuthnProvider implements AuthnProviderInterface
{
    private AuthnServiceInterface $authnService;

    public function __construct()
    {
        $this->authnService = new AuthnService();
    }

    public function getSignedInUser(): ?array
    {
        if (!isset($_SESSION['user'])) {
            return null;
        }
        return $_SESSION['user'];
    }

    public function signin(string $userId, string $password): array
    {
        try {
            $userData = $this->authnService->signin($userId, $password);
            $_SESSION['user'] = $userData;
            return $userData;
        } catch (UserNotFoundException | AuthnException $e) {
            throw new \RuntimeException($e->getMessage(), 0, $e);
        }
    }
}