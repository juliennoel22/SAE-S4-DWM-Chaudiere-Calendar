# 📱 LaChaudiere.app

Application mobile Flutter pour consulter les événements culturels proposés par **La Chaudière**. Elle consomme une API REST externe, affiche la liste des événements, permet la recherche, le filtrage, le tri, et propose une vue détail complète.

> Projet SAE - Atelier développement d’applications  
> BUT Informatique - Semestre 4  
> Rendu : 14 juin 2025

---

## 📸 Fonctionnalités réalisées

### 🗂️ Affichage de la liste des événements
- Liste alphabétique avec titre, type et date.
- Chargement dynamique depuis l'API.
- Thème clair/sombre intégré.


### 🔍 Recherche d’événements
- Recherche en direct par titre.
- Résultats mis à jour dynamiquement.



### 🧭 Filtrage par catégorie
- Boutons ou menu déroulant pour filtrer les événements selon leur type (concert, expo, etc.).

### 🔃 Tri des événements
- Tri personnalisable :
  - Par date (↑ / ↓)
  - Par titre
  - Par type

### 📄 Vue détail d’un événement
- Affichage complet d’un événement : description, lieu, date, image, type, etc.
- Navigation Master/Détail fluide.

### 🌗 Thème clair / sombre
- Toggle entre mode clair et mode sombre via Provider.


## 🧱 Structure du projet
lib/
├── main.dart
├── chaudiere_app.dart # Configuration de l'app
├── models/ # Modèles de données (ex: Event)
│ └── event.dart
  └── event_detail.dart
├── providers/ # Provider pour thème clair/sombre
│ └── theme_provider.dart
├── screens/ # Écrans principaux
│ ├── event_master.dart # Liste, tri, recherche
│ └── event_detail.dart # Détail d'un événement
└── services/ # Appels API HTTP
└── api_service.dart


## 🚀 Lancer l’application
> ⚠️ **ATTENTION**  
> Avant de lancer les commandes suivantes, assurez-vous que vous êtes bien **dans le répertoire `chaudiere_app`** (là où se trouve `pubspec.yaml`).
```bash
cd chaudiere_app   # si ce n’est pas déjà le cas
flutter pub get
flutter run


