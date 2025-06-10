<?php

declare(strict_types=1); 

namespace calendar\core\application_core\application\usecase;

use calendar\core\application_core\application\exceptions\AuthnException;
use calendar\core\application_core\application\entities\User;
use calendar\core\application_core\application\providers\AuthnProvider;

use Ramsey\Uuid\Uuid;

class AuthnService implements AuthnServiceInterface
{
    public function signin(string $userId, string $password): array
    {
        $user = User::where('email', $userId)->first();

        if (!$user) {
            throw new \RuntimeException("Utilisateur introuvable");
        }
        if (!password_verify($password, $user->password_hash)) {
            throw new AuthnException("Mot de passe incorrect.");
        }
        return $user->toArray();
    }
}