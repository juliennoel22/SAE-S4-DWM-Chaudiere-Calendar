import { fetchEventById } from './api.js';
import { renderEventsList } from './ui.js';
import { applyFilters } from './filters.js';

const FAVORITES_STORAGE_KEY = 'lachaudiere_favorites';
let favorites = [];

export function loadFavorites() {
    try {
        const storedFavorites = localStorage.getItem(FAVORITES_STORAGE_KEY);
        favorites = storedFavorites ? JSON.parse(storedFavorites) : [];
        return favorites;
    } catch (e) {
        console.error('Erreur de chargement des favoris:', e);
        return [];
    }
}

function saveFavorites() {
    try {
        localStorage.setItem(FAVORITES_STORAGE_KEY, JSON.stringify(favorites));
    } catch (e) {
        console.error('Erreur de sauvegarde des favoris:', e);
    }
}

export function isFavorite(eventId) {
    return favorites.includes(Number(eventId));
}

export function toggleFavorite(eventId) {
    eventId = Number(eventId);
    const index = favorites.indexOf(eventId);

    if (index === -1) {
        favorites.push(eventId);
    } else {
        favorites.splice(index, 1);
    }

    saveFavorites();
    updateFavoriteButtons(eventId);
    return isFavorite(eventId);
}

function updateFavoriteButtons(eventId) {
    const isFav = isFavorite(eventId);

    // Boutons dans la liste
    document.querySelectorAll(`.favorite-button[data-id="${eventId}"]`).forEach(button => {
        button.classList.toggle('active', isFav);
        button.innerHTML = isFav ? '★' : '☆';
    });

    // Bouton dans la vue détail
    const detailButton = document.querySelector(`.detail-favorite[data-id="${eventId}"]`);
    if (detailButton) {
        detailButton.classList.toggle('active', isFav);
        detailButton.innerHTML = isFav ? 'Retirer des favoris ★' : 'Ajouter aux favoris ☆';
    }
}

export async function renderFavorites(allEvents, categoryFilter = 'all', sortFilter = 'date-asc', timeFilter = 'current') {
    const favoritesList = document.getElementById('favorites-list');
    const currentFavorites = loadFavorites();

    if (!currentFavorites || currentFavorites.length === 0) {
        favoritesList.innerHTML = '<div class="no-favorites">Vous n\'avez pas encore d\'événements favoris.</div>';
        return;
    }

    try {
        let favoriteEvents;

        if (allEvents && allEvents.length > 0) {
            // Utiliser les événements déjà chargés
            favoriteEvents = allEvents.filter(event => currentFavorites.includes(Number(event.id)));
        } else {
            // Charger les événements depuis l'API
            favoritesList.innerHTML = '<div class="loading">Chargement des favoris...</div>';
            const favoritePromises = currentFavorites.map(id => fetchEventById(id));
            favoriteEvents = await Promise.all(favoritePromises);
        }

        if (favoriteEvents.length === 0) {
            favoritesList.innerHTML = '<div class="no-favorites">Aucun événement favori trouvé.</div>';
            return;
        }

        // Appliquer les filtres aux favoris
        const filteredFavorites = applyFilters(favoriteEvents, categoryFilter, sortFilter, timeFilter);
        renderEventsList(filteredFavorites, favoritesList);

    } catch (error) {
        console.error('Erreur lors du chargement des favoris:', error);
        favoritesList.innerHTML = '<div class="error">Impossible de charger vos favoris.</div>';
    }
}
