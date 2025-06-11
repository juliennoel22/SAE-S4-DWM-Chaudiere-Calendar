<?php

namespace calendar\core\application_core\application\useCases;

interface EventServiceInterface
{
    /**
     * Retourne la liste des événements triés par date de début.
     */
    public function getEvents(): array;

    /**
     * Crée un nouvel événement à partir des données fournies.
     */
    public function createEvent(array $data): array;

    /**
     * Retourne un événement par son ID.
     */
    public function getEventById(int $id): array;

        public function getEventsByCategory(int $categoryId): array;
}