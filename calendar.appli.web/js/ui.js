import { Event } from './event.js';
import { Category } from './category.js';
import { isFavorite } from './favorites.js';
import { convertMarkdownToHtml } from './markdown.js';

// Compiler les templates Handlebars
const eventCardTemplate = Handlebars.compile(document.getElementById('event-card-template').innerHTML);
const categoryCardTemplate = Handlebars.compile(document.getElementById('category-card-template').innerHTML);
const eventDetailTemplate = Handlebars.compile(document.getElementById('event-detail-template').innerHTML);
const noResultsTemplate = Handlebars.compile(document.getElementById('no-results-template').innerHTML);

export function renderEventsList(events, container = null) {
    const eventsContainer = container || document.getElementById('events-list');

    if (!events || events.length === 0) {
        eventsContainer.innerHTML = noResultsTemplate({ message: 'Aucun événement trouvé pour ces critères.' });
        return;
    }

    const eventsHtml = events.map(eventData => {
        const event = new Event(eventData);
        return eventCardTemplate({
            id: event.id,
            mainImageUrl: event.getMainImageUrl(),
            titre: event.titre,
            category: event.category,
            date: event.date,
            formattedDate: event.getFormattedDate(),
            isFavorite: isFavorite(event.id)
        });
    }).join('');

    eventsContainer.innerHTML = eventsHtml;
}

export function renderCategoriesList(categories) {
    const categoriesContainer = document.getElementById('categories-list');

    if (!categories || categories.length === 0) {
        categoriesContainer.innerHTML = noResultsTemplate({ message: 'Aucune catégorie disponible.' });
        return;
    }

    const categoriesHtml = categories.map(categoryData => {
        const category = new Category(categoryData);
        return categoryCardTemplate({
            id: category.id,
            label: category.label,
            description: category.description
        });
    }).join('');

    categoriesContainer.innerHTML = categoriesHtml;
}

export function renderEventDetail(eventData) {
    const detailContainer = document.getElementById('event-content');
    const event = new Event(eventData);

    // Convertir le markdown en HTML
    const htmlDescription = event.htmlDescription || convertMarkdownToHtml(event.description);

    const detailHtml = eventDetailTemplate({
        id: event.id,
        titre: event.titre,
        isFavorite: isFavorite(event.id),
        formattedDate: event.getFormattedDate(),
        time: event.time || 'Non spécifiée',
        price: event.price,
        category: event.category,
        hasImage: event.hasImage(),
        mainImageUrl: event.getMainImageUrl(),
        htmlDescription: htmlDescription
    });

    detailContainer.innerHTML = detailHtml;
}

export function showSection(sectionId) {
    // Liste de tous les conteneurs
    const sections = [
        'events-container',
        'categories-container',
        'favorites-container',
        'event-detail'
    ];

    // Cacher tous les conteneurs
    sections.forEach(id => {
        const section = document.getElementById(id);
        if (section) {
            section.classList.add('hidden');
        }
    });

    // Afficher le conteneur demandé
    const activeSection = document.getElementById(sectionId);
    if (activeSection) {
        activeSection.classList.remove('hidden');
    }

    // Gérer l'affichage des filtres
    const filtersSection = document.getElementById('filters');
    if (filtersSection) {
        if (sectionId === 'event-detail') {
            filtersSection.classList.add('hidden');
        } else {
            filtersSection.classList.remove('hidden');
        }
    }
}

export function setActiveNavLink(view) {
    // Retirer la classe active de tous les liens
    const navLinks = document.querySelectorAll('.main-nav a');
    navLinks.forEach(link => {
        link.classList.remove('active');
    });

    // Ajouter la classe active au lien correspondant
    if (view === 'event-detail') {
        view = 'events'; // En mode détail, le lien Événements reste actif
    }

    const activeLink = document.getElementById(`${view}-link`);
    if (activeLink) {
        activeLink.classList.add('active');
    }
}
