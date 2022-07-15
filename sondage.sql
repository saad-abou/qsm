-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 11 juil. 2022 à 18:41
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sondage`
--

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_11_05_114755_create_questions_table', 1),
(6, '2020_11_05_115302_create_reponses_table', 1),
(7, '2021_01_06_100345_create_user_answers_table', 1),
(8, '2022_07_11_133932_create_scores_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Qst` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id`, `Qst`, `created_at`, `updated_at`) VALUES
(1, 'question 1', NULL, NULL),
(2, 'question 2', NULL, NULL),
(3, 'question 3', NULL, NULL),
(4, 'question 4', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reponses`
--

CREATE TABLE `reponses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rps` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vrai` tinyint(1) NOT NULL DEFAULT 0,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reponses`
--

INSERT INTO `reponses` (`id`, `rps`, `vrai`, `question_id`, `created_at`, `updated_at`) VALUES
(1, 'question 1 reponse 1', 0, 1, NULL, NULL),
(2, 'question 1 reponse 2', 0, 1, NULL, NULL),
(3, 'question 1 reponse 3', 0, 1, NULL, NULL),
(4, 'question 1 reponse 4', 1, 1, NULL, NULL),
(5, 'question 2 reponse 1', 0, 2, NULL, NULL),
(6, 'question 2 reponse 2', 1, 2, NULL, NULL),
(7, 'question 2 reponse 3', 0, 2, NULL, NULL),
(8, 'question 2 reponse 4', 0, 2, NULL, NULL),
(9, 'question 3 reponse 1', 1, 3, NULL, NULL),
(10, 'question 3 reponse 2', 0, 3, NULL, NULL),
(11, 'question 3 reponse 3', 0, 3, NULL, NULL),
(12, 'question 3 reponse 4', 0, 3, NULL, NULL),
(17, 'question 4 reponse 1', 0, 4, NULL, NULL),
(18, 'question 4 reponse 2', 0, 4, NULL, NULL),
(19, 'question 4 reponse 3', 1, 4, NULL, NULL),
(20, 'question 4 reponse 4', 0, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `scores`
--

CREATE TABLE `scores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `score`, `created_at`, `updated_at`) VALUES
(1, 'saad sen aboubzou', 'saad_niko@hotmail.com', NULL, '$2y$10$xLx0LTtGSNko9RCOl1nSQ.5GZbhDqQ8Yma3hR/n5hGw7yKSTbdU2.', NULL, 8, '2022-07-11 13:08:18', '2022-07-11 15:15:56'),
(2, 'SAAD', 'test@gmail.com', NULL, '$2y$10$lrdNsKuWU0ySbsWeTLdaEOw8xxTZkAixL1Yvc3HWkX4E8Zcz/pzx6', NULL, NULL, '2022-07-11 15:21:56', '2022-07-11 15:21:56'),
(3, 'SAAD', 'tes2t@gmail.com', NULL, '$2y$10$MnmcjjIbujgHi5zF.5PSrOQXS6RjM8SfG6H23tA/KFN5X7Doae5Si', NULL, NULL, '2022-07-11 15:30:12', '2022-07-11 15:30:12'),
(4, ',DBA', 'test55@gmail.com', NULL, '$2y$10$k4n0eMbyknHw7.Dc194.lu7uvyD3cMMdQ5JSoE2vT4b/l2xPN0H4m', NULL, NULL, '2022-07-11 15:33:31', '2022-07-11 15:33:31'),
(5, 'saad sen aboubzou', 'testjj@gmai.com', NULL, '$2y$10$ZhR44x5t/Kq1VlnAujRv8ueETHvokLPbt9dZjBj9bEYz3IqVtBffm', NULL, NULL, '2022-07-11 15:35:53', '2022-07-11 15:35:53'),
(6, 'tyiweuiw', 'tesssst@gmail.com', NULL, '$2y$10$PqN7Rv4Iq.pJPL0J49q6xelKmm948mpktR5Xx53t.dc3cEJY0ibUK', NULL, 5, '2022-07-11 15:38:45', '2022-07-11 15:38:51'),
(7, 'saad sen aboubzou', 'saad.sen.niko@gmail.com', NULL, '$2y$10$CtoQjC9zr/QKLN1VdG9ajOmnbaaWfn0OHcjzde.EMieJK255FnHta', NULL, 1, '2022-07-11 15:40:56', '2022-07-11 15:41:01');

-- --------------------------------------------------------

--
-- Structure de la table `user_answers`
--

CREATE TABLE `user_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `answer` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reponse_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_answers`
--

INSERT INTO `user_answers` (`id`, `created_at`, `updated_at`, `answer`, `user_id`, `reponse_id`) VALUES
(32, '2022-07-11 15:15:56', '2022-07-11 15:15:56', 1, 1, 4),
(33, '2022-07-11 15:15:56', '2022-07-11 15:15:56', 0, 1, 5),
(34, '2022-07-11 15:15:56', '2022-07-11 15:15:56', 1, 1, 9),
(35, '2022-07-11 15:15:56', '2022-07-11 15:15:56', 1, 1, 19),
(36, '2022-07-11 15:38:51', '2022-07-11 15:38:51', 1, 6, 4),
(37, '2022-07-11 15:38:51', '2022-07-11 15:38:51', 1, 6, 9),
(38, '2022-07-11 15:38:51', '2022-07-11 15:38:51', 0, 6, 18),
(39, '2022-07-11 15:41:01', '2022-07-11 15:41:01', 1, 7, 4),
(40, '2022-07-11 15:41:01', '2022-07-11 15:41:01', 0, 7, 5),
(41, '2022-07-11 15:41:01', '2022-07-11 15:41:01', 0, 7, 18);

-- --------------------------------------------------------

--
-- Structure de la table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reponses`
--
ALTER TABLE `reponses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reponses_question_id_foreign` (`question_id`);

--
-- Index pour la table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `reponses`
--
ALTER TABLE `reponses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reponses`
--
ALTER TABLE `reponses`
  ADD CONSTRAINT `reponses_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
