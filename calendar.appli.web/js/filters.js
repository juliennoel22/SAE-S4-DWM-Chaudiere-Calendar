import { Event } from './event.js';

export function applyFilters(events, categoryFilter, sortFilter, timeFilter) {
    if (!events || !Array.isArray(events)) return [];

    // Transformer en instances Event si nécessaire
    const eventInstances = events.map(e => e instanceof Event ? e : new Event(e));

    // Étape 1: Filtrage par catégorie
    let filteredEvents = categoryFilter === 'all'
        ? eventInstances
        : eventInstances.filter(event => String(event.category).toLowerCase() === getCategoryNameById(categoryFilter) ||
            String(event.category.id) === String(categoryFilter));

    // Étape 2: Filtrage par période
    filteredEvents = filterByTime(filteredEvents, timeFilter);

    // Étape 3: Tri
    return sortEvents(filteredEvents, sortFilter);
}

function filterByTime(events, timeFilter) {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const currentMonth = today.getMonth();
    const currentYear = today.getFullYear();

    switch (timeFilter) {
        case 'current':
            // Événements du mois courant
            return events.filter(event => {
                const eventDate = new Date(event.startDate);
                return eventDate.getMonth() === currentMonth &&
                    eventDate.getFullYear() === currentYear;
            });

        case 'past':
            // Événements passés
            return events.filter(event => {
                const eventDate = new Date(event.startDate);
                eventDate.setHours(23, 59, 59, 999);
                return eventDate < today;
            });

        case 'future':
            // Événements futurs
            return events.filter(event => {
                const eventDate = new Date(event.startDate);
                eventDate.setHours(0, 0, 0, 0);
                return eventDate > today;
            });

        default:
            return events;
    }
}

function sortEvents(events, sortFilter) {
    switch (sortFilter) {
        case 'date-asc':
            return events.sort((a, b) => new Date(a.startDate) - new Date(b.startDate));

        case 'date-desc':
            return events.sort((a, b) => new Date(b.startDate) - new Date(a.startDate));

        case 'title':
            return events.sort((a, b) => a.title.localeCompare(b.title));

        default:
            return events;
    }
}

function getCategoryNameById(categoryId) {
    // Mapping simplifié des catégories (à remplacer par une version dynamique)
    const categories = {
        '1': 'concert',
        '2': 'expo',
        '3': 'conférence',
        '4': 'spectacle'
    };

    return categories[categoryId] || categoryId;
}
