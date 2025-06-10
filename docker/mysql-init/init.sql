-- Création de la base
CREATE DATABASE chaudiere_agenda;

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



USE chaudiere_agenda;

-- Utilisateurs
INSERT INTO users (email, password_hash, is_superadmin)
VALUES 
('admin1@email.fr', '$2y$10$e0VPA7TGBuG5CAjUd4vYAeA3v4wrFJbKoDkKwDcmA2OePaS77nO8e', TRUE),
('admin2@email.fr', '$2y$10$6NzH9CahHg1wKnMbZzGOiuw0qpiR/PA4SEmU6H.LFgPH9W.XixYaW', FALSE);

-- Catégories
INSERT INTO categories (label, description)
VALUES 
('Concert', 'Spectacles musicaux et performances live'),
('Expo', 'Expositions temporaires ou permanentes'),
('Conférence', 'Rencontres et débats avec des intervenants'),
('Spectacle', 'Théâtre, danse, performances scéniques');

-- Événements
INSERT INTO events (title, description_md, description_html, price, date_start, date_end, time, category_id, published, created_by)
VALUES 
('Jazz Night', 'Soirée jazz avec des musiciens locaux.', '<p>Soirée jazz avec des musiciens locaux.</p>', '10€', '2025-06-15', NULL, '20:00:00', 1, TRUE, 1),
('Expo Photo Urbaine', 'Une plongée visuelle dans la ville moderne.', '<p>Une plongée visuelle dans la ville moderne.</p>', 'Gratuit', '2025-06-10', '2025-07-10', NULL, 2, TRUE, 1),
('Conférence IA', 'L\'avenir de l\'intelligence artificielle.', '<p>L\'avenir de l\'intelligence artificielle.</p>', '5€', '2025-06-20', NULL, '18:00:00', 3, TRUE, 2),
('Théâtre : L\'absurde', 'Une pièce sur le non-sens moderne.', '<p>Une pièce sur le non-sens moderne.</p>', '15€', '2025-06-18', '2025-06-19', '21:00:00', 4, FALSE, 2);

-- Images associées aux événements
INSERT INTO event_images (event_id, url)
VALUES 
(1, 'https://cdn.example.com/images/jazz-night.jpg'),
(2, 'https://cdn.example.com/images/photo-expo.jpg'),
(3, 'https://cdn.example.com/images/conference-ia.jpg'),
(4, 'https://cdn.example.com/images/theatre-absurde.jpg'),
(4, 'https://cdn.example.com/images/theatre-absurde2.jpg');
