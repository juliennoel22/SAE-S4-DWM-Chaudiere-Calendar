<?php
namespace calendar\core\application_core\application\useCases;


use Illuminate\Database\QueryException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use calendar\core\application_core\application\useCases\EventServiceInterface;
use calendar\core\application_core\application\entities\Event;

class EventService implements EventServiceInterface
{
    /**
     * Retourne la liste des événements triés par date de début.
     */
    public function getEvents(): array
    {
        try {
            return Event::with('category')
                ->orderBy('date_start')
                ->get()
                ->toArray();
        } catch (QueryException $e) {
            throw new \Exception("Erreur lors de la récupération des événements");
        }
    }

    /**
     * Crée un nouvel événement à partir des données fournies.
     */
    public function createEvent(array $data): array
    {
        try {
            $event = new Event();
            $event->title = $data['title'];
            $event->description_md = $data['description_md'];
            $event->description_html = $data['description_html'];
            $event->price = $data['price'] ?? null;
            $event->date_start = $data['date_start'];
            $event->date_end = $data['date_end'] ?? null;
            $event->time = $data['time'] ?? null;
            $event->category_id = $data['category_id'];
            $event->published = $data['published'] ?? false;
            $event->created_by = $data['created_by'];
            $event->save();

            return $event->toArray();
        } catch (QueryException $e) {
            throw new \Exception("Erreur lors de la création de l'événement");
        }
    }

    /**
     * Retourne un événement par son ID.
     */
    public function getEventById(int $id): array
    {
        try {
            $event = Event::with(relations: 'category')->findOrFail($id);
            return $event->toArray();
        } catch (ModelNotFoundException $e) {
            throw new \Exception("Événement $id non trouvé");
        } catch (QueryException $e) {
            throw new \Exception("Erreur lors de la récupération de l'événement");
        }
    }
    public function getEventsByCategory(int $categoryId): array
{
    try {
        return Event::with('category')
            ->where('category_id', $categoryId)
            ->orderBy('date_start')
            ->get()
            ->toArray();
    } catch (QueryException $e) {
        throw new \Exception("Erreur lors de la récupération des événements par catégorie");
    }
}
}