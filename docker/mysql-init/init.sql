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
-- Images associées aux événements
INSERT INTO event_images (event_id, url)
VALUES (
        1,
        'https://images.pexels.com/photos/9419405/pexels-photo-9419405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        2,
        'https://images.pexels.com/photos/9808642/pexels-photo-9808642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        3,
        'https://images.pexels.com/photos/6476783/pexels-photo-6476783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ),
    (
        4,
        'https://images.pexels.com/photos/713149/pexels-photo-713149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    );
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
        'Festival du Printemps',
        'Un festival pour célébrer le printemps.',
        'Un festival pour célébrer le printemps.',
        '12€',
        '2025-04-10',
        NULL,
        '15:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Atelier Peinture',
        'Atelier créatif pour tous.',
        'Atelier créatif pour tous.',
        '8€',
        '2025-05-05',
        NULL,
        '14:00:00',
        2,
        TRUE,
        2
    ),
    (
        'Conférence Climat',
        'Discussion sur le changement climatique.',
        'Discussion sur le changement climatique.',
        'Gratuit',
        '2025-06-22',
        NULL,
        '17:00:00',
        3,
        TRUE,
        1
    ),
    (
        'Soirée Théâtre',
        'Pièce comique pour toute la famille.',
        'Pièce comique pour toute la famille.',
        '10€',
        '2025-07-01',
        NULL,
        '20:30:00',
        4,
        FALSE,
        2
    ),
    (
        'Concert Rock',
        'Groupe local en live.',
        'Groupe local en live.',
        '15€',
        '2025-07-15',
        NULL,
        '21:00:00',
        1,
        TRUE,
        1
    ),
    (
        'Expo Sculpture',
        'Exposition de sculptures modernes.',
        'Exposition de sculptures modernes.',
        '5€',
        '2025-08-10',
        '2025-08-20',
        NULL,
        2,
        TRUE,
        2
    ),
    (
        'Conférence Santé',
        'Prévention et bien-être.',
        'Prévention et bien-être.',
        'Gratuit',
        '2025-09-12',
        NULL,
        '18:00:00',
        3,
        TRUE,
        1
    ),
    (
        'Spectacle Magie',
        'Show de magie pour enfants.',
        'Show de magie pour enfants.',
        '7€',
        '2025-10-05',
        NULL,
        '16:00:00',
        4,
        TRUE,
        2
    ),
    (
        'Concert Classique',
        'Orchestre symphonique.',
        'Orchestre symphonique.',
        '20€',
        '2025-11-20',
        NULL,
        '19:30:00',
        1,
        TRUE,
        1
    ),
    (
        'Expo Photo Nature',
        'Beauté de la nature en images.',
        'Beauté de la nature en images.',
        'Gratuit',
        '2025-12-01',
        '2025-12-15',
        NULL,
        2,
        TRUE,
        2
    );
INSERT INTO event_images (event_id, url)
VALUES (
        5,
        'https://images.pexels.com/photos/2101187/pexels-photo-2101187.jpeg?auto=compress&cs=tinysrgb&w=800'
    ),
    (
        6,
        'https://images.pexels.com/photos/1103970/pexels-photo-1103970.jpeg?auto=compress&cs=tinysrgb&w=800'
    ),
    (
        7,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=800'
    ),
    (
        8,
        'https://images.pexels.com/photos/713149/pexels-photo-713149.jpeg?auto=compress&cs=tinysrgb&w=800'
    ),
    (
        9,
        'https://images.pexels.com/photos/164936/pexels-photo-164936.jpeg?auto=compress&cs=tinysrgb&w=800'
    ),
    (
        10,
        'https://images.pexels.com/photos/356079/pexels-photo-356079.jpeg?auto=compress&cs=tinysrgb&w=800'
    ),
    (
        11,
        'https://images.pexels.com/photos/355465/pexels-photo-355465.jpeg?auto=compress&cs=tinysrgb&w=800'
    ),
    (
        12,
        'https://images.pexels.com/photos/167964/pexels-photo-167964.jpeg?auto=compress&cs=tinysrgb&w=800'
    ),
    (
        13,
        'https://images.pexels.com/photos/164936/pexels-photo-164936.jpeg?auto=compress&cs=tinysrgb&w=800'
    ),
    (
        14,
        'https://images.pexels.com/photos/1103970/pexels-photo-1103970.jpeg?auto=compress&cs=tinysrgb&w=800'
    );