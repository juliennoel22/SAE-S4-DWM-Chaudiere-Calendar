USE calendar_db;
SET NAMES utf8;
-- Table des utilisateurs (admin)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    is_superadmin BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Table des catégories
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Table des événements
CREATE TABLE events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description_md TEXT NOT NULL,
    description_html TEXT,
    price VARCHAR(50),
    date_start DATE NOT NULL,
    date_end DATE,
    time TIME,
    category_id INT NOT NULL,
    published BOOLEAN DEFAULT FALSE,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (created_by) REFERENCES users(id)
);
-- Table des images associées à un événement
CREATE TABLE event_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    url VARCHAR(255) NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(id)
);
-- Utilisateurs
INSERT INTO users (email, password_hash, is_superadmin)
VALUES (
        'admin1@email.fr',
        '$2y$10$e0VPA7TGBuG5CAjUd4vYAeA3v4wrFJbKoDkKwDcmA2OePaS77nO8e',
        TRUE
    ),
    (
        'admin2@email.fr',
        '$2y$10$6NzH9CahHg1wKnMbZzGOiuw0qpiR/PA4SEmU6H.LFgPH9W.XixYaW',
        FALSE
    ),
    (
        'adm@email.fr',
        '$2y$10$qcJkl9nYlA6ZeeQwkzN8HuS4GqnR/Jsif0GFlJhbJRw69LJZdzF0G',
        TRUE
    ),
    (
        'user@email.fr',
        '$2y$10$ROvjeEVr1qcSApO.mtSYWOJEvbX8FkMB9uLA9raVr6ngdZEjtXvJu',
        FALSE
    );
-- Utilisateurs supplémentaires
INSERT INTO users (email, password_hash, is_superadmin)
VALUES (
        'testuser1@email.fr',
        '$2y$10$abcdef1234567890abcdef1234567890abcdef1234567890abcdef12',
        FALSE
    ),
    (
        'testuser2@email.fr',
        '$2y$10$123456abcdef123456abcdef123456abcdef123456abcdef123456ab',
        FALSE
    );
-- Catégories
INSERT INTO categories (label, description)
VALUES (
        'Concert',
        'Spectacles musicaux et performances live'
    ),
    ('Expo', 'Expositions temporaires ou permanentes'),
    (
        'Conférence',
        'Rencontres et débats avec des intervenants'
    ),
    (
        'Spectacle',
        'Théâtre, danse, performances scéniques'
    );
-- Catégories supplémentaires
INSERT INTO categories (label, description)
VALUES ('Atelier', 'Ateliers pratiques et interactifs'),
    ('Festival', 'Événements festifs et culturels');
-- Événements
INSERT INTO events (
        title,
        description_md,
        description_html,
        price,
        date_start,
        date_end,
        time,
        category_id,
        published,
        created_by
    )
VALUES (
        'Jazz Night',
        'Soirée jazz avec des musiciens locaux.',
        'Soirée jazz avec des musiciens locaux.',
        '10€',
        '2025-06-15',
        NULL,
        '20:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Expo Photo Urbaine',
        'Une plongée visuelle dans la ville moderne.',
        'Une plongée visuelle dans la ville moderne.',
        'Gratuit',
        '2025-06-10',
        '2025-07-10',
        NULL,
        2,
        TRUE,
        1
    ),
    (
        'Conférence IA',
        'Lavenir de lintelligence artificielle.',
        'Lavenir de lintelligence artificielle.',
        '5€',
        '2025-06-20',
        NULL,
        '18:00:00',
        3,
        TRUE,
        2
    ),
    (
        'Théâtre : Labsurde',
        'Une pièce sur le non-sens moderne.',
        'Une pièce sur le non-sens moderne',
        '15€',
        '2025-06-18',
        '2025-06-19',
        '21:00:00',
        4,
        FALSE,
        2
    );
-- Événements supplémentaires
INSERT INTO events (
        title,
        description_md,
        description_html,
        price,
        date_start,
        date_end,
        time,
        category_id,
        published,
        created_by
    )
VALUES (
        'Atelier Peinture',
        'Atelier pour apprendre les bases de la peinture.',
        'Atelier pour apprendre les bases de la peinture.',
        '20€',
        '2025-07-01',
        NULL,
        '14:00:00',
        5,
        TRUE,
        3
    ),
    (
        'Festival de Musique',
        'Un festival avec des artistes internationaux.',
        'Un festival avec des artistes internationaux.',
        '50€',
        '2025-08-10',
        '2025-08-12',
        '16:00:00',
        6,
        TRUE,
        4
    ),
    (
        'Atelier Cuisine',
        'Apprenez à cuisiner des plats traditionnels.',
        'Apprenez à cuisiner des plats traditionnels.',
        '30€',
        '2025-07-15',
        NULL,
        '10:00:00',
        5,
        FALSE,
        3
    ),
    (
        'Festival de Cinéma',
        'Projection de films indépendants.',
        'Projection de films indépendants.',
        'Gratuit',
        '2025-09-01',
        '2025-09-03',
        '18:00:00',
        6,
        TRUE,
        4
    ),
    (
        'Soirée Rock',
        'Un concert de rock avec des groupes locaux.',
        'Un concert de rock avec des groupes locaux.',
        '25€',
        '2025-07-20',
        NULL,
        '19:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Exposition Peinture',
        'Découvrez des œuvres d\'artistes contemporains.',
        'Découvrez des œuvres d\'artistes contemporains.',
        'Gratuit',
        '2025-08-01',
        '2025-08-15',
        NULL,
        2,
        TRUE,
        2
    ),
    (
        'Conférence Climat',
        'Discussion sur les enjeux climatiques actuels.',
        'Discussion sur les enjeux climatiques actuels.',
        '10€',
        '2025-07-25',
        NULL,
        '17:00:00',
        3,
        TRUE,
        3
    ),
    (
        'Spectacle Comédie',
        'Une soirée de rires avec des comédiens talentueux.',
        'Une soirée de rires avec des comédiens talentueux.',
        '20€',
        '2025-07-30',
        NULL,
        '20:30:00',
        4,
        FALSE,
        4
    );
-- 50 Événements supplémentaires
INSERT INTO events (
        title,
        description_md,
        description_html,
        price,
        date_start,
        date_end,
        time,
        category_id,
        published,
        created_by
    )
VALUES (
        'Concert Pop',
        'Un concert de musique pop.',
        'Un concert de musique pop.',
        '30€',
        '2025-07-01',
        NULL,
        '19:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Exposition Art Moderne',
        'Une exposition d\'art moderne.',
        'Une exposition d\'art moderne.',
        'Gratuit',
        '2025-07-05',
        '2025-07-20',
        NULL,
        2,
        TRUE,
        2
    ),
    (
        'Conférence Santé',
        'Discussion sur les avancées médicales.',
        'Discussion sur les avancées médicales.',
        '15€',
        '2025-07-10',
        NULL,
        '15:00:00',
        3,
        TRUE,
        3
    ),
    (
        'Spectacle Magie',
        'Un spectacle de magie pour toute la famille.',
        'Un spectacle de magie pour toute la famille.',
        '20€',
        '2025-07-15',
        NULL,
        '18:00:00',
        4,
        FALSE,
        4
    ),
    (
        'Concert Jazz',
        'Une soirée jazz avec des artistes internationaux.',
        'Une soirée jazz avec des artistes internationaux.',
        '40€',
        '2025-07-20',
        NULL,
        '20:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Exposition Photographie',
        'Une exposition de photographies de paysages.',
        'Une exposition de photographies de paysages.',
        'Gratuit',
        '2025-07-25',
        '2025-08-10',
        NULL,
        2,
        TRUE,
        2
    ),
    (
        'Conférence Technologie',
        'Les dernières innovations technologiques.',
        'Les dernières innovations technologiques.',
        '10€',
        '2025-07-30',
        NULL,
        '14:00:00',
        3,
        TRUE,
        3
    ),
    (
        'Spectacle Théâtre',
        'Une pièce de théâtre classique.',
        'Une pièce de théâtre classique.',
        '25€',
        '2025-08-01',
        NULL,
        '19:30:00',
        4,
        FALSE,
        4
    ),
    (
        'Concert Rock',
        'Un concert de rock avec des groupes locaux.',
        'Un concert de rock avec des groupes locaux.',
        '35€',
        '2025-08-05',
        NULL,
        '21:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Exposition Sculpture',
        'Une exposition de sculptures modernes.',
        'Une exposition de sculptures modernes.',
        'Gratuit',
        '2025-08-10',
        '2025-08-25',
        NULL,
        2,
        TRUE,
        2
    ),
    (
        'Conférence Environnement',
        'Les défis environnementaux actuels.',
        'Les défis environnementaux actuels.',
        '20€',
        '2025-08-15',
        NULL,
        '16:00:00',
        3,
        TRUE,
        3
    ),
    (
        'Spectacle Danse',
        'Un spectacle de danse contemporaine.',
        'Un spectacle de danse contemporaine.',
        '30€',
        '2025-08-20',
        NULL,
        '20:00:00',
        4,
        FALSE,
        4
    ),
    (
        'Concert Classique',
        'Un concert de musique classique.',
        'Un concert de musique classique.',
        '50€',
        '2025-08-25',
        NULL,
        '18:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Exposition Histoire',
        'Une exposition sur l\'histoire locale.',
        'Une exposition sur l\'histoire locale.',
        'Gratuit',
        '2025-08-30',
        '2025-09-15',
        NULL,
        2,
        TRUE,
        2
    ),
    (
        'Conférence Économie',
        'Les tendances économiques mondiales.',
        'Les tendances économiques mondiales.',
        '25€',
        '2025-09-01',
        NULL,
        '17:00:00',
        3,
        TRUE,
        3
    ),
    (
        'Spectacle Humour',
        'Une soirée de stand-up comedy.',
        'Une soirée de stand-up comedy.',
        '15€',
        '2025-09-05',
        NULL,
        '21:00:00',
        4,
        FALSE,
        4
    ),
    (
        'Concert Électro',
        'Une soirée électro avec des DJ internationaux.',
        'Une soirée électro avec des DJ internationaux.',
        '45€',
        '2025-09-10',
        NULL,
        '22:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Exposition Design',
        'Une exposition de design contemporain.',
        'Une exposition de design contemporain.',
        'Gratuit',
        '2025-09-15',
        '2025-09-30',
        NULL,
        2,
        TRUE,
        2
    ),
    (
        'Conférence Science',
        'Les découvertes scientifiques récentes.',
        'Les découvertes scientifiques récentes.',
        '20€',
        '2025-09-20',
        NULL,
        '14:30:00',
        3,
        TRUE,
        3
    ),
    (
        'Spectacle Cirque',
        'Un spectacle de cirque moderne.',
        'Un spectacle de cirque moderne.',
        '25€',
        '2025-09-25',
        NULL,
        '19:00:00',
        4,
        FALSE,
        4
    ),
    (
        'Concert Folk',
        'Un concert de musique folk.',
        'Un concert de musique folk.',
        '30€',
        '2025-10-01',
        NULL,
        '20:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Exposition Architecture',
        'Une exposition sur l\'architecture contemporaine.',
        'Une exposition sur l\'architecture contemporaine.',
        'Gratuit',
        '2025-10-05',
        '2025-10-20',
        NULL,
        2,
        TRUE,
        2
    ),
    (
        'Conférence Politique',
        'Les enjeux politiques actuels.',
        'Les enjeux politiques actuels.',
        '15€',
        '2025-10-10',
        NULL,
        '16:00:00',
        3,
        TRUE,
        3
    ),
    (
        'Spectacle Opéra',
        'Une représentation d\'opéra classique.',
        'Une représentation d\'opéra classique.',
        '50€',
        '2025-10-15',
        NULL,
        '19:30:00',
        4,
        FALSE,
        4
    ),
    (
        'Concert Blues',
        'Une soirée blues avec des artistes locaux.',
        'Une soirée blues avec des artistes locaux.',
        '20€',
        '2025-10-20',
        NULL,
        '21:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Exposition Mode',
        'Une exposition sur la mode contemporaine.',
        'Une exposition sur la mode contemporaine.',
        'Gratuit',
        '2025-10-25',
        '2025-11-10',
        NULL,
        2,
        TRUE,
        2
    ),
    (
        'Conférence Éducation',
        'Les défis de l\'éducation moderne.',
        'Les défis de l\'éducation moderne.',
        '10€',
        '2025-11-01',
        NULL,
        '15:00:00',
        3,
        TRUE,
        3
    ),
    (
        'Spectacle Ballet',
        'Une représentation de ballet classique.',
        'Une représentation de ballet classique.',
        '40€',
        '2025-11-05',
        NULL,
        '20:00:00',
        4,
        FALSE,
        4
    ),
    (
        'Concert Reggae',
        'Un concert de musique reggae.',
        'Un concert de musique reggae.',
        '25€',
        '2025-11-10',
        NULL,
        '19:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Exposition Peinture',
        'Une exposition de peintures abstraites.',
        'Une exposition de peintures abstraites.',
        'Gratuit',
        '2025-11-15',
        '2025-11-30',
        NULL,
        2,
        TRUE,
        2
    ),
    (
        'Conférence Histoire',
        'Les grandes figures historiques.',
        'Les grandes figures historiques.',
        '20€',
        '2025-11-20',
        NULL,
        '14:00:00',
        3,
        TRUE,
        3
    ),
    (
        'Spectacle Marionnettes',
        'Un spectacle de marionnettes pour enfants.',
        'Un spectacle de marionnettes pour enfants.',
        '10€',
        '2025-11-25',
        NULL,
        '16:00:00',
        4,
        FALSE,
        4
    ),
    (
        'Concert Métal',
        'Un concert de métal avec des groupes internationaux.',
        'Un concert de métal avec des groupes internationaux.',
        '50€',
        '2025-12-01',
        NULL,
        '21:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Exposition Sculpture',
        'Une exposition de sculptures classiques.',
        'Une exposition de sculptures classiques.',
        'Gratuit',
        '2025-12-05',
        '2025-12-20',
        NULL,
        2,
        TRUE,
        2
    ),
    (
        'Conférence Littérature',
        'Les grands auteurs contemporains.',
        'Les grands auteurs contemporains.',
        '15€',
        '2025-12-10',
        NULL,
        '17:00:00',
        3,
        TRUE,
        3
    ),
    (
        'Spectacle Improvisation',
        'Une soirée d\'improvisation théâtrale.',
        'Une soirée d\'improvisation théâtrale.',
        '20€',
        '2025-12-15',
        NULL,
        '20:00:00',
        4,
        FALSE,
        4
    ),
    (
        'Concert Rap',
        'Un concert de rap avec des artistes locaux.',
        'Un concert de rap avec des artistes locaux.',
        '30€',
        '2025-12-20',
        NULL,
        '19:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Exposition Photographie',
        'Une exposition de photographies en noir et blanc.',
        'Une exposition de photographies en noir et blanc.',
        'Gratuit',
        '2025-12-25',
        '2026-01-10',
        NULL,
        2,
        TRUE,
        2
    ),
    (
        'Conférence Philosophie',
        'Les grandes questions philosophiques.',
        'Les grandes questions philosophiques.',
        '10€',
        '2025-12-30',
        NULL,
        '14:30:00',
        3,
        TRUE,
        3
    ),
    (
        'Spectacle Cabaret',
        'Une soirée cabaret avec des artistes talentueux.',
        'Une soirée cabaret avec des artistes talentueux.',
        '35€',
        '2026-01-05',
        NULL,
        '21:00:00',
        4,
        FALSE,
        4
    );
-- Images associées aux événements
INSERT INTO event_images (event_id, url)
VALUES (
        1,
        'https://images.pexels.com/photos/9808642/pexels-photo-9808642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        2,
        'https://images.pexels.com/photos/9419405/pexels-photo-9419405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        3,
        'https://images.pexels.com/photos/713149/pexels-photo-713149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        4,
        'https://images.pexels.com/photos/6476783/pexels-photo-6476783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        5,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        6,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        7,
        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        8,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        9,
        'https://images.pexels.com/photos/1640778/pexels-photo-1640778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        10,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        11,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        12,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        13,
        'https://images.pexels.com/photos/9808642/pexels-photo-9808642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        14,
        'https://images.pexels.com/photos/9419405/pexels-photo-9419405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        15,
        'https://images.pexels.com/photos/713149/pexels-photo-713149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        16,
        'https://images.pexels.com/photos/6476783/pexels-photo-6476783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        17,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        18,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        19,
        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        20,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        21,
        'https://images.pexels.com/photos/1640778/pexels-photo-1640778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        22,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        23,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        24,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        25,
        'https://images.pexels.com/photos/9808642/pexels-photo-9808642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        26,
        'https://images.pexels.com/photos/9419405/pexels-photo-9419405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        27,
        'https://images.pexels.com/photos/713149/pexels-photo-713149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        28,
        'https://images.pexels.com/photos/6476783/pexels-photo-6476783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        29,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        30,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        31,
        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        32,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        33,
        'https://images.pexels.com/photos/1640778/pexels-photo-1640778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        34,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        35,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        36,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        37,
        'https://images.pexels.com/photos/9808642/pexels-photo-9808642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        38,
        'https://images.pexels.com/photos/9419405/pexels-photo-9419405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        39,
        'https://images.pexels.com/photos/713149/pexels-photo-713149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        40,
        'https://images.pexels.com/photos/6476783/pexels-photo-6476783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        41,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        42,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        43,
        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        44,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        45,
        'https://images.pexels.com/photos/1640778/pexels-photo-1640778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        46,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        47,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        48,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        49,
        'https://images.pexels.com/photos/9808642/pexels-photo-9808642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        50,
        'https://images.pexels.com/photos/9419405/pexels-photo-9419405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        51,
        'https://images.pexels.com/photos/713149/pexels-photo-713149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        52,
        'https://images.pexels.com/photos/6476783/pexels-photo-6476783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        53,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        54,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        55,
        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        56,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        57,
        'https://images.pexels.com/photos/1640778/pexels-photo-1640778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        58,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        59,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        60,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        61,
        'https://images.pexels.com/photos/9808642/pexels-photo-9808642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        62,
        'https://images.pexels.com/photos/9419405/pexels-photo-9419405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        63,
        'https://images.pexels.com/photos/713149/pexels-photo-713149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        64,
        'https://images.pexels.com/photos/6476783/pexels-photo-6476783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        65,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        66,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        67,
        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        68,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        69,
        'https://images.pexels.com/photos/1640778/pexels-photo-1640778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        70,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        71,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        72,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        73,
        'https://images.pexels.com/photos/9808642/pexels-photo-9808642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        74,
        'https://images.pexels.com/photos/9419405/pexels-photo-9419405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        75,
        'https://images.pexels.com/photos/713149/pexels-photo-713149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        76,
        'https://images.pexels.com/photos/6476783/pexels-photo-6476783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        77,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        78,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        79,
        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        80,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        81,
        'https://images.pexels.com/photos/1640778/pexels-photo-1640778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        82,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        83,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        84,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        85,
        'https://images.pexels.com/photos/9808642/pexels-photo-9808642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        86,
        'https://images.pexels.com/photos/9419405/pexels-photo-9419405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        87,
        'https://images.pexels.com/photos/713149/pexels-photo-713149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        88,
        'https://images.pexels.com/photos/6476783/pexels-photo-6476783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        89,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        90,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        91,
        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        92,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        93,
        'https://images.pexels.com/photos/1640778/pexels-photo-1640778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        94,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        95,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        96,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        97,
        'https://images.pexels.com/photos/9808642/pexels-photo-9808642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        98,
        'https://images.pexels.com/photos/9419405/pexels-photo-9419405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        99,
        'https://images.pexels.com/photos/713149/pexels-photo-713149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        100,
        'https://images.pexels.com/photos/6476783/pexels-photo-6476783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        101,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        102,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        103,
        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        104,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        105,
        'https://images.pexels.com/photos/1640778/pexels-photo-1640778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        106,
        'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        107,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        108,
        'https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    );