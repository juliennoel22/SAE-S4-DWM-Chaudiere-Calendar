import { fetchEvents, fetchCategories, fetchEventById } from './api.js';
import { renderEventsList, renderCategoriesList, renderEventDetail, showSection, setActiveNavLink } from './ui.js';
import { applyFilters } from './filters.js';
import { loadFavorites, renderFavorites, toggleFavorite } from './favorites.js';

class App {
    constructor() {
        this.events = [];
        this.categories = [];
        this.currentView = 'events';
        this.selectedCategory = 'all';
        this.selectedSort = 'date-asc';
        this.selectedTimeFilter = 'current';
        this.previousView = 'events';

        this.initDomElements();
        this.initEventListeners();
    }

    initDomElements() {
        // Éléments DOM
        this.navLinks = {
            events: document.getElementById('events-link'),
            categories: document.getElementById('categories-link'),
            favorites: document.getElementById('favorites-link')
        };

        this.filters = {
            category: document.getElementById('category-filter'),
            sort: document.getElementById('sort-filter'),
            month: document.getElementById('month-filter'),
            favCategory: document.getElementById('favorites-category-filter'),
            favSort: document.getElementById('favorites-sort-filter'),
            favMonth: document.getElementById('favorites-month-filter')
        };

        this.backButton = document.getElementById('back-button');
    }

    async init() {
        try {
            // Charger les favoris
            loadFavorites();

            // Chargement des données
            const [eventsData, categoriesData] = await Promise.all([
                fetchEvents(),
                fetchCategories()
            ]);

            this.events = eventsData;
            this.categories = categoriesData;

            // Remplir les filtres de catégories
            this.populateCategoryFilters();

            // Rendu initial
            this.renderCurrentView();
        } catch (error) {
            console.error('Erreur d\'initialisation:', error);
            this.showError('Impossible de charger les données.');
        }
    }

    initEventListeners() {
        // Navigation
        Object.entries(this.navLinks).forEach(([view, link]) => {
            link.addEventListener('click', (e) => {
                e.preventDefault();
                this.switchView(view);
            });
        });

        // Filtres événements
        this.filters.category.addEventListener('change', () => this.handleFiltersChange());
        this.filters.sort.addEventListener('change', () => this.handleFiltersChange());
        this.filters.month.addEventListener('change', () => this.handleFiltersChange());

        // Filtres favoris
        this.filters.favCategory.addEventListener('change', () => this.handleFavoritesFiltersChange());
        this.filters.favSort.addEventListener('change', () => this.handleFavoritesFiltersChange());
        this.filters.favMonth.addEventListener('change', () => this.handleFavoritesFiltersChange());

        // Retour à la liste
        this.backButton.addEventListener('click', (e) => {
            e.preventDefault();
            this.switchView(this.previousView);
        });

        // Délégation d'événements
        document.addEventListener('click', async (e) => {
            const eventCard = e.target.closest('.event-card');
            if (eventCard) {
                e.preventDefault();
                await this.showEventDetail(eventCard.dataset.id);
                return;
            }

            const categoryCard = e.target.closest('.category-card');
            if (categoryCard) {
                e.preventDefault();
                this.filterByCategory(categoryCard.dataset.id);
                return;
            }

            const favoriteBtn = e.target.closest('.favorite-button');
            if (favoriteBtn) {
                e.preventDefault();
                this.handleFavorite(favoriteBtn.dataset.id);
                return;
            }
        });
    }

    switchView(view) {
        if (this.currentView !== 'event-detail') {
            this.previousView = this.currentView;
        }
        this.currentView = view;
        setActiveNavLink(view);
        this.renderCurrentView();
    }

    renderCurrentView() {
        switch (this.currentView) {
            case 'events':
                showSection('events-container');
                this.renderFilteredEvents();
                break;
            case 'categories':
                showSection('categories-container');
                renderCategoriesList(this.categories);
                break;
            case 'favorites':
                showSection('favorites-container');
                this.renderFilteredFavorites();
                break;
            case 'event-detail':
                showSection('event-detail');
                break;
        }
    }

    handleFiltersChange() {
        this.selectedCategory = this.filters.category.value;
        this.selectedSort = this.filters.sort.value;
        this.selectedTimeFilter = this.filters.month.value;
        this.renderFilteredEvents();
    }

    handleFavoritesFiltersChange() {
        const category = this.filters.favCategory.value;
        const sort = this.filters.favSort.value;
        const time = this.filters.favMonth.value;
        this.renderFilteredFavorites(category, sort, time);
    }

    renderFilteredEvents() {
        const filteredEvents = applyFilters(
            this.events,
            this.selectedCategory,
            this.selectedSort,
            this.selectedTimeFilter
        );
        renderEventsList(filteredEvents);
    }

    renderFilteredFavorites(category = 'all', sort = 'date-asc', time = 'current') {
        renderFavorites(this.events, category, sort, time);
    }

    async showEventDetail(eventId) {
        try {
            const eventDetail = await fetchEventById(eventId);
            renderEventDetail(eventDetail);
            this.currentView = 'event-detail';
            showSection('event-detail');
        } catch (error) {
            console.error('Erreur de chargement des détails:', error);
            this.showError('Impossible de charger les détails.');
        }
    }

    filterByCategory(categoryId) {
        this.selectedCategory = categoryId;
        this.filters.category.value = categoryId;
        this.switchView('events');
    }

    handleFavorite(eventId) {
        const isNowFavorite = toggleFavorite(eventId);

        // Rafraîchir la vue favoris si nécessaire
        if (this.currentView === 'favorites') {
            this.renderFilteredFavorites();
        }

        this.showFeedback(isNowFavorite ?
            'Ajouté aux favoris' :
            'Retiré des favoris'
        );
    }

    populateCategoryFilters() {
        // Remplir les deux sélecteurs de catégories (events et favorites)
        [this.filters.category, this.filters.favCategory].forEach(select => {
            while (select.options.length > 1) {
                select.remove(1);
            }

            this.categories.forEach(category => {
                const option = document.createElement('option');
                option.value = category.id;
                option.textContent = category.label;
                select.appendChild(option);
            });
        });
    }

    showError(message) {
        const errorContainer = document.createElement('div');
        errorContainer.className = 'error-message';
        errorContainer.textContent = message;
        document.querySelector('main').prepend(errorContainer);
        setTimeout(() => errorContainer.remove(), 3000);
    }

    showFeedback(message) {
        const feedbackElement = document.createElement('div');
        feedbackElement.className = 'feedback-message';
        feedbackElement.textContent = message;
        document.body.appendChild(feedbackElement);

        setTimeout(() => {
            feedbackElement.classList.add('show');
            setTimeout(() => {
                feedbackElement.classList.remove('show');
                setTimeout(() => feedbackElement.remove(), 300);
            }, 1500);
        }, 10);
    }
}

// Lancement de l'application
document.addEventListener('DOMContentLoaded', () => {
    const app = new App();
    app.init();
});
