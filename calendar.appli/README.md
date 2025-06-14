# Backend PHP Dockerisé – **LaChaudièreAgenda.core**

> Projet backend PHP structuré, sécurisé et conteneurisé, construit avec **Slim Framework**, **Twig** et une architecture modulaire orientée métier.
> * Réalisé par **[Julien](https://github.com/juliennoel22)**, **[Mirac](https://github.com/MiracOK)**, **[Guillaume](https://github.com/Kemayu)** et **[Vivien](https://github.com/Vivienhrm)**

![PHP](https://img.shields.io/badge/PHP-8.1-8892BF?style=flat-square&logo=php&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)
![Twig](https://img.shields.io/badge/Twig-FFD900?style=flat-square&logo=twig&logoColor=black)
![Slim](https://img.shields.io/badge/Slim_Framework-000000?style=flat-square&logo=slim&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=white)
![REST API](https://img.shields.io/badge/API-REST-FF5733?style=flat-square&logo=api&logoColor=white)

---

## Fonctionnalités principales

### 🔐 Authentification & utilisateurs
- **Connexion utilisateur sécurisée** : Gestion de la connexion utilisateur avec protection CSRF, gestion de session et gestion des erreurs d'authentifiaction. Une fois rempli le formulaire de connexion et connecté il a accès aux autres fonctionnalités.

- **Déconnexion** : Déconnexion de l'utilisateur (`LogoutAction`)

- **Création d'utilisateur** : Si l'utilisateur a un statut de super administrateur il peut créer de nouveaux comptes avec saisie : 
  - `email` 
  - `mot de passe`.
Affichage du formulaire avec la route '/create/user'(`CreateUserAction`, `DisplayUserFormAction`)

### 🗂️ Gestion des catégories
- **Liste des catégories** : un utilisateur peut afficher la liste des catégories (`ListCategoriesAction`)

- **Création sécurisée de catégorie** : avec protection CSRF il peut remplir un formulaire pour créer une nouvelle catégorie avec :
  - `libellé`
  - `description (Markdown)`
Stockage et affichage dans la base de données

- **API REST** : récupération de toutes les catégories au format JSON via `/api/categories`

### 📅 Gestion des événements
- **Création d’événement** : Formulaire sécurisé de saisie d’un événement avec :
  - `titre`
  - `description` (Markdown)
  - `tarif`
  - `date` soit `début/fin`
  - `horaire`
  - `categorie`
  - `Etat de publication`
  (`CreateEventAction`, `DisplayEventFormAction`)

- **Liste des événements** : Affichage de la liste des événements, avec filtrage optionnel par catégorie à la route `/events?category_id=x`

- **Détail d’un événement** Affichage des détails d'un événement à la route à la route `/events/x`

- **Toggle publication** : Activation/désactivation de la publication d'un événement via un boutton toggle

- **API REST** :
  - Tous les événements (`ApiEventListAction`)
  - Par catégorie (`ApiEventListByCategoryAction`)
  - Détail spécifique (`ApiEventDetailAction`)

### 🌐 Autres
- **Redirection** : Redirection de la racine vers une autre page
- **Entrée API** : Point d'entrée API général via (`ApiIndexAction`)

---

## Architecture & choix techniques

- **Slim Framework** : routage rapide et minimaliste
- **Twig** : moteur de templates HTML
- **Structure MVC** :
  - `webui/actions` : contrôleurs web
  - `application_core/application/entities` : entités métier
  - `application_core/application/providers` : services & providers
- **Bootstrap** : Initialisant l'application et configurant les dépendances (`src/conf/bootstrap.php`)
- **Routes** définies dans `src/conf/routes.php` via le Framework Slim
- **Gestion des erreurs** : page personnalisée avec affichage du message d'erreur adapté (`error.twig`)
- **CSS** : Style global appliqué à l'interface dans (`public/css/`)

---

## Docker & base de données

Ce backend est **totalement dockerisé** pour faciliter le déploiement et l’intégration.

### 📁 Arborescence pertinente
- `docker/` : configuration Docker
- `docker/mysql-init/` : dossier pour l'initialisation de la BDD MySQL

### ▶️ Lancement rapide

1. **Cloner le dépôt**
   ```bash
   git clone https://github.com/juliennoel22/SAE-S4-DWM-Chaudiere-Calendar.git
   ```

2. **Construire et lancer**
   ```bash
   docker compose up --build -d
   ```

3. **Accéder à l'application**
   ```bash
   http://localhost:8888
   ```