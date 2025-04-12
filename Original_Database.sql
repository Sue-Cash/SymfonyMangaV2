-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql
-- Généré le : jeu. 03 avr. 2025 à 09:16
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `app`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `label`, `created_at`, `updated_at`) VALUES
(2, 'Shonen', '2025-01-30 17:19:11', '2025-01-30 17:19:11');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250123154934', '2025-01-23 17:35:12', 90),
('DoctrineMigrations\\Version20250130135633', '2025-01-30 14:56:52', 49),
('DoctrineMigrations\\Version20250130145133', '2025-01-30 15:51:50', 61),
('DoctrineMigrations\\Version20250130151720', '2025-01-30 16:18:26', 113),
('DoctrineMigrations\\Version20250130155819', '2025-01-30 16:58:59', 121),
('DoctrineMigrations\\Version20250130163156', '2025-01-30 17:32:32', 42);

-- --------------------------------------------------------

--
-- Structure de la table `manga`
--

CREATE TABLE `manga` (
  `id` int NOT NULL,
  `price` double NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `manga`
--

INSERT INTO `manga` (`id`, `price`, `created_at`, `updated_at`, `title`, `category_id`) VALUES
(4, 6.95, '2025-01-30 17:27:14', '2025-01-30 17:27:14', 'Dragon Ball', 2),
(5, 7.99, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'One Piece', 2),
(6, 5, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Aimée Maillard', 2),
(7, 10, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Jeanne Millet', 2),
(8, 6, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Maurice de la Fabre', 2),
(9, 8, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Christiane Traore', 2),
(10, 9, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Manon-Alexandrie Morel', 2),
(11, 9, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Céline Klein', 2),
(12, 3, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Margaret Breton-Le Roux', 2),
(13, 5, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Adrien de la Blanchet', 2),
(14, 5, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Jean Gimenez', 2),
(15, 6, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Odette Lacombe-Alves', 2),
(16, 10, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Antoine Gomes', 2),
(17, 4, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Diane-Renée Riviere', 2),
(18, 7, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Eugène Valentin', 2),
(19, 3, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Frédéric Lefevre', 2),
(20, 10, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Gilbert Pichon', 2),
(21, 7, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Bernadette Langlois', 2),
(22, 10, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Richard Jacob', 2),
(23, 7, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Éric-Théophile Weber', 2),
(24, 5, '2025-02-27 11:48:40', '2025-02-27 11:48:40', 'Vincent Berger', 2),
(26, 6.67, '2025-04-03 11:08:21', '2025-04-03 11:08:21', 'Hajime No Ippo', 2);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'test00@test.com', '[\"ROLE_ADMIN\"]', '$2y$13$l2BI1Mlek8ky5WSuLKXVse3yOe7FP5QHgbDmAzdMVFd97s9apUkX2'),
(2, 'test01@test.com', '[]', '$2y$13$XxiVKtbZ.NaQ7EvH0LduxuaMIe0TiPhUWXBDJ0hxLrR6h2jHLhwVu'),
(3, 'admin0@test.com', '[]', '$2y$13$xKc40Kn2RD7egiRpoZwX4O6J0ST0IGPTiDHVGQlobrEYNpE4dgbtq');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `manga`
--
ALTER TABLE `manga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_765A9E0312469DE2` (`category_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `manga`
--
ALTER TABLE `manga`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `manga`
--
ALTER TABLE `manga`
  ADD CONSTRAINT `FK_765A9E0312469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
