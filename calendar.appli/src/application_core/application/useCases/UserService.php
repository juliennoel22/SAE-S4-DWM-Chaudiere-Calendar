<?php

namespace calendar\core\application_core\application\useCases;

use calendar\core\application_core\application\entities\User;
use calendar\core\application_core\application\exceptions\UserServiceException;
use Illuminate\Database\QueryException;

class UserService implements UserServiceInterface 
{

    public function createUser(string $email, string $password): void
    {
        try {
            $user = new User();
            $user->email = $email;
            $user->password_hash = password_hash($password, PASSWORD_DEFAULT);
            $user->is_superadmin = false;
            $user->save();
        } catch (QueryException $e) {
            throw new UserServiceException("Erreur lors de la création de l'utilisateur : " . $e->getMessage());
        }
    }
}