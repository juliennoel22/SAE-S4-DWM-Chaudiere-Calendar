<?php

namespace calendar\core\application_core\application\useCases;

use calendar\core\application_core\application\entities\User;
use calendar\core\application_core\application\exceptions\UserServiceException;
use Illuminate\Database\QueryException;

class UserService implements UserServiceInterface 
{
    
    public function createUser(string $email, string $password): void
    {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            throw new UserServiceException("Adresse email invalide");
        }
        if (User::where('email', $email)->exists()) {
            throw new UserServiceException("Un utilisateur avec cet email existe déjà");
        }
        
        try {
            $user = new User();
            $user->email = htmlspecialchars($email, ENT_QUOTES, 'UTF-8');
            $user->password_hash = password_hash($password, PASSWORD_DEFAULT);
            $user->is_superadmin = false;
            $user->save();
        } catch (QueryException $e) {
            throw new UserServiceException("Erreur lors de la création de l'utilisateur : " . $e->getMessage());
        }
    }
}