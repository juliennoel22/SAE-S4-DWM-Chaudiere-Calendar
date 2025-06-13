# LaChaudièreAgenda - Documentation

Cette documentation explique le fonctionnement de l'application LaChaudièreAgenda, une Single Page Application (SPA) qui permet de visualiser les événements culturels de La Chaudière.

## Structure du projet

L'application suit une architecture modulaire avec séparation des responsabilités :

```
calendar.appli.web/
├── index.html            # Structure HTML principale et templates Handlebars
├── css/
│   └── styles.css        # Styles CSS de l'application
└── js/
    ├── app.js            # Point d'entrée et coordination de l'application
    ├── api.js            # Gestion des appels à l'API
    ├── event.js          # Classe Event (modèle pour les événements)
    ├── category.js       # Classe Category (modèle pour les catégories)
    ├── ui.js             # Gestion de l'interface utilisateur et templating
    ├── filters.js        # Filtrage et tri des événements
    ├── favorites.js      # Gestion des événements favoris
    └── markdown.js       # Conversion du Markdown en HTML
```

## Fonctionnement

### Initialisation de l'application

L'entrée principale de l'application se trouve dans `app.js`. Lors du chargement de la page :

1. Une instance de la classe `App` est créée
2. La méthode `init()` est appelée qui :
   - Charge les favoris depuis le localStorage
   - Effectue des requêtes asynchrones vers l'API pour récupérer les événements et les catégories
   - Remplit les filtres de catégories
   - Rend la vue initiale (liste des événements du mois courant)

```javascript
// Dans app.js
document.addEventListener('DOMContentLoaded', () => {
    const app = new App();
    app.init();
});
```

### Communication avec l'API

Le module `api.js` gère toutes les communications avec l'API backend :

```javascript
// Dans api.js
const API_BASE_URL = 'http://localhost:8080/api';

// Fonction générique pour les appels API
async function fetchFromApi(endpoint) {
    try {
        const response = await fetch(`${API_BASE_URL}${endpoint}`);
        // Vérification de la réponse et gestion d'erreur
        if (!response.ok) {
            throw new Error(`Erreur HTTP ${response.status}`);
        }
        return await response.json();
    } catch (error) {
        console.error(`Erreur lors de la requête à ${endpoint}:`, error);
        throw error;
    }
}

// Exemples de fonctions exposées :
export async function fetchEvents() {...}
export async function fetchEventById(id) {...}
export async function fetchCategories() {...}
```

### Modèles de données

Les données sont représentées à travers des classes modèles :

#### La classe Event (`event.js`)

Cette classe encapsule les données d'un événement et fournit des méthodes utilitaires :

```javascript
// Dans event.js
export class Event {
    constructor(data) {
        this.id = data.id;
        this.titre = data.titre;
        this.date = data.date || data.date_debut;
        this.category = data.categorie || data.category;
        this.description = data.description_md || '';
        this.htmlDescription = data.description_html || '';
        // ...autres propriétés...
    }

    // Méthodes utilitaires
    hasImage() {...}
    getMainImageUrl() {...}
    getFormattedDate() {...}
    getTimeStatus() {...}
    isInCurrentMonth() {...}
}
```

#### La classe Category (`category.js`)

Similaire à la classe Event, elle encapsule les données d'une catégorie :

```javascript
// Dans category.js
export class Category {
    constructor(data) {
        this.id = data.id;
        this.label = data.label;
        this.description = data.description;
        this.createdAt = data.created_at;
    }

    getColor() {...}
}
```

### Interface utilisateur

Le module `ui.js` gère le rendu de l'interface avec Handlebars :

```javascript
// Dans ui.js
// Compile les templates Handlebars depuis index.html
const eventCardTemplate = Handlebars.compile(document.getElementById('event-card-template').innerHTML);
const categoryCardTemplate = Handlebars.compile(document.getElementById('category-card-template').innerHTML);
const eventDetailTemplate = Handlebars.compile(document.getElementById('event-detail-template').innerHTML);

// Fonctions de rendu
export function renderEventsList(events) {...}
export function renderCategoriesList(categories) {...}
export function renderEventDetail(eventData) {...}
export function showSection(sectionId) {...}
export function setActiveNavLink(view) {...}
```

Les templates Handlebars sont définis dans `index.html` :

```html
<!-- Dans index.html -->
<script id="event-card-template" type="text/x-handlebars-template">
  <article class="event-card" data-id="{{id}}">
    <!-- Structure HTML du template -->
  </article>
</script>
```

### Filtrage et tri

Le module `filters.js` est responsable du filtrage et du tri des événements selon différents critères :

```javascript
// Dans filters.js
export function applyFilters(events, categoryFilter, sortFilter, timeFilter) {
    // 1. Filtrage par catégorie
    let filteredEvents = filterByCategory(events, categoryFilter);
    
    // 2. Filtrage par période temporelle (courant, passé, futur)
    filteredEvents = filterByTime(filteredEvents, timeFilter);
    
    // 3. Tri (date ascendante/descendante, titre)
    return sortEvents(filteredEvents, sortFilter);
}
```

### Gestion des favoris

Le module `favorites.js` gère la sauvegarde et le chargement des événements favoris via le localStorage :

```javascript
// Dans favorites.js
const FAVORITES_STORAGE_KEY = 'lachaudiere_favorites';
let favorites = [];

export function loadFavorites() {...}
export function isFavorite(eventId) {...}
export function toggleFavorite(eventId) {...}
export async function renderFavorites(allEvents, categoryFilter, sortFilter, timeFilter) {...}
```

### Conversion Markdown

Le module `markdown.js` convertit les descriptions d'événements du format Markdown vers HTML :

```javascript
// Dans markdown.js
export function convertMarkdownToHtml(markdown) {
    if (!markdown) return '';

    let html = markdown;

    // Conversion des titres, listes, emphases, liens, etc.
    html = html.replace(/^# (.+)$/gm, '<h1>$1</h1>');
    // ...autres conversions...

    return html;
}
```

## Flux d'utilisation

### Navigation principale

L'application permet de naviguer entre 3 vues principales et une vue détaillée :

1. **Événements** : Liste des événements avec filtres
2. **Catégories** : Liste des catégories disponibles
3. **Favoris** : Liste des événements marqués comme favoris
4. **Détail d'événement** : Affichage détaillé d'un événement spécifique

La navigation est gérée par la classe `App` via la méthode `switchView()`.

### Filtrage et tri

Les utilisateurs peuvent filtrer les événements par :

- **Catégorie** : Toutes les catégories ou une catégorie spécifique
- **Période** : Mois courant, événements passés ou événements futurs
- **Tri** : Par date (ascendante/descendante) ou par titre alphabétique

### Favoris

Les événements peuvent être marqués comme favoris en cliquant sur l'icône étoile. Ces favoris sont :

1. Stockés dans le localStorage du navigateur
2. Accessibles via l'onglet "Favoris"
3. Persistants entre les sessions de navigation

## Interactions principales

1. **Clic sur un événement** : Affiche les détails de l'événement
2. **Clic sur une catégorie** : Filtre les événements par cette catégorie
3. **Clic sur un bouton favori** : Ajoute/supprime l'événement des favoris
4. **Changement de filtre** : Actualise la liste des événements selon les critères
5. **Clic sur "Retour à la liste"** : Revient à la vue précédente

## Gestion des erreurs

L'application intègre une gestion d'erreurs robuste :

- Lors des appels API : Capture et affiche un message d'erreur
- Lors du chargement des favoris : Gestion des erreurs localStorage
- Messages de feedback pour les actions utilisateur (ajout/suppression de favoris)

## Flux de données

1. **Chargement initial** : app.js → api.js → app.js (stockage) → ui.js (rendu)
2. **Filtrage** : app.js (récupère valeurs filtres) → filters.js (applique filtres) → ui.js (rendu)
3. **Détail événement** : app.js → api.js (fetchEventById) → ui.js (renderEventDetail)
4. **Favoris** : app.js → favorites.js (toggleFavorite) → localStorage → ui.js (mise à jour interface)

Cette architecture modulaire facilite la maintenance et l'évolution de l'application tout en respectant les principes de séparation des responsabilités.
