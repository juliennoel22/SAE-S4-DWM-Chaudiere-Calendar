# Checklist du Projet LaChaudièreAgenda

## Fonctionnalités de base
- [x] setup la structure
- [x] header et footer + style de base
### Navigation (1, 2, 3, 5)
- [ ] Affichage de la liste des événements du mois courant
- [ ] Filtrage de la liste d'événements par catégorie
- [ ] Affichage de la liste des catégories avec navigation
- [ ] Affichage des événements passés
- [ ] Affichage des événements futurs

### Affichage (4)
- [ ] Affichage complet d'un événement (détails)
- [ ] Affichage des informations principales (titre, artiste, date, catégorie)
- [ ] Conversion Markdown → HTML pour les descriptions

## Fonctions étendues (6, 7, 8)

### Tri et filtrage (6)
- [ ] Tri des listes par date ascendante
- [ ] Tri des listes par date descendante
- [ ] Tri des listes par titre (A-Z)
- [ ] Tri des listes par titre (Z-A)

### Affichage d'images (7)
- [ ] Affichage de l'image associée à un événement si présente

### Événements préférés (8)
- [ ] Marquer un événement comme favori
- [ ] Stocker les favoris dans le localStorage
- [ ] Afficher la liste des événements favoris

## Architecture technique

### Structure du code
- [ ] Organisation en modules JavaScript (import/export)
- [ ] Séparation des responsabilités (affichage / fonctionnalités / requêtes)
- [ ] Utilisation de classes et objets JavaScript
- [ ] Fonctions sur les tableaux (map, filter, etc.)

### API et asynchrone
- [ ] Utilisation de fetch pour les appels API
- [ ] Gestion des promesses
- [ ] Traitement des erreurs
- [ ] Affichage de spinners pendant le chargement

### DOM et templates
- [ ] Manipulation correcte du DOM
- [ ] Gestion des écouteurs d'événements (listeners)
- [x] Utilisation de templates (Handlebars)
- [ ] Séparation claire JS/CSS

## Déploiement
- [ ] Code disponible sur un dépôt Git public
- [ ] Application déployée sur docketu.iutnc.univ-lorraine.fr
- [ ] Documentation dans un fichier PDF
- [ ] Jeu de données réalistes pour la démonstration

## Problèmes à résoudre
- [ ] Le filtrage par catégorie ne fonctionne pas correctement
- [ ] Persistance de la sélection de catégorie après navigation
- [ ] Gestion des événements sans image
