<?php
namespace calendar\core\application_core\application\useCases;


use calendar\core\application_core\application\exceptions\EventServiceException;
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
            throw new EventServiceException("Erreur lors de la récupération des événements");
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
            throw new EventServiceException("Erreur lors de la création de l'événement");
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
            throw new EventServiceException("Événement $id non trouvé");
        } catch (QueryException $e) {
            throw new EventServiceException("Erreur lors de la récupération de l'événement");
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
        throw new EventServiceException("Erreur lors de la récupération des événements par catégorie");
    }
}
public function getEventsForApi(array $periode = [], ?int $categoryId = null): array
{
    try {
        $query = Event::with('category')->orderBy('date_start');

        if ($categoryId) {
            $query->where('category_id', $categoryId);
        }

        $today = date('Y-m-d');
        $monthStart = date('Y-m-01');
        $monthEnd = date('Y-m-t');

        if ($periode) {
            $query->where(function($q) use ($periode, $today, $monthStart, $monthEnd) {
                if (in_array('passee', $periode)) {
                    $q->orWhere('date_start', '<', $monthStart);
                }
                if (in_array('courante', $periode)) {
                    $q->orWhereBetween('date_start', [$monthStart, $monthEnd]);
                }
                if (in_array('futur', $periode)) {
                    $q->orWhere('date_start', '>', $monthEnd);
                }
            });
        }

        $events = $query->get();

        // Formatage pour l'API
        return $events->map(function($event) {
            return [
                'id' => $event->id,
                'titre' => $event->title,
                'date' => $event->date_start,
                'categorie' => $event->category ? $event->category->label : null,
                'url' => '/api/evenements/' . $event->id
            ];
        })->toArray();
    } catch (QueryException $e) {
        throw new EventServiceException("Erreur lors de la récupération des événements pour l'API");
    }
}

public function getEventDetailForApi(int $eventId): ?array
{
    try {
        $event = Event::with('category', 'images', 'creator')->find($eventId);
        if (!$event) {
            return null;
        }
        return [
            'id' => $event->id,
            'titre' => $event->title,
            'description_md' => $event->description_md,
            'description_html' => $event->description_html,
            'prix' => $event->price,
            'date_debut' => $event->date_start,
            'date_fin' => $event->date_end,
            'heure' => $event->time,
            'categorie' => $event->category ? $event->category->label : null,
            'published' => $event->published,
            'created_by' => $event->creator ? $event->creator->email : null,
            'images' => $event->images ? $event->images->pluck('url')->toArray() : [],
            'created_at' => $event->created_at,
        ];
    } catch (\Exception $e) {
        return null;
    }
}

public function togglePublish(int $eventId): void
{
try {
        $event = Event::findOrFail($eventId);
        $event->published = !$event->published;
        $event->save();
    } catch (ModelNotFoundException $e) {
        throw new EventServiceException("Événement $eventId non trouvé");
    } catch (QueryException $e) {
        throw new EventServiceException("Erreur lors du changement de statut de publication");
    }
}
}