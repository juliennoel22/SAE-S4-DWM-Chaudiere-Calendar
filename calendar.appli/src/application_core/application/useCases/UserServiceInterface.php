<?php

namespace calendar\core\application_core\application\useCases;

interface UserServiceInterface
{
    /**
     * Crée un nouvel utilisateur administrateur (non super-admin).
     */
    public function createUser(string $email, string $password): void;
}