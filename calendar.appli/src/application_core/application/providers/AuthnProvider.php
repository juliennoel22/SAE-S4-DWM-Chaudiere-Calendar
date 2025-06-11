<?php

declare(strict_types=1);

namespace calendar\core\application_core\application\providers;

use calendar\core\application_core\application\entities\User;
use calendar\core\application_core\application\exceptions\AuthnException;
use calendar\core\application_core\application\exceptions\UserNotFoundException;
use calendar\core\application_core\application\exceptions\ProviderInternalErrorException;
use Illuminate\Database\QueryException;

class AuthnProvider implements AuthnProviderInterface
{

    public function signin(string $userEmail, string $password): void
    {
        try {
            $user = User::where('email', $userEmail)->first();

        if (!$user) {
            throw new UserNotFoundException("Utilisateur introuvable");
        }
        if (!password_verify($password, $user->password_hash)) {
            throw new AuthnException("Mot de passe incorrect");
        }
        session_regenerate_id(true); // Sécurité
        $_SESSION['user'] = $user->email;
        } catch (QueryException $e) {
            throw new ProviderInternalErrorException($e->getMessage(), 0, $e);
        }
    }
}