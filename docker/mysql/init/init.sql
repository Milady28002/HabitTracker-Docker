-- Base de données : `habit_tracker_api`
--

-- --------------------------------------------------------

--
-- Structure de la table `habit`
--

CREATE TABLE `habit` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `done` tinyint(4) NOT NULL,
  `days` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`days`)),
  `owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `habit`
--

INSERT INTO `habit` (`id`, `title`, `done`, `days`, `owner_id`) VALUES
(2, 'Méditer 10min', 1, '[\"lundi\",\"mercredi\"]', 1),
(3, 'faire une méditation pleine conscience', 1, '[\"mardi\",\"samedi\"]', 1),
(4, 'Boire 1.5L', 0, '[]', 1),
(5, 'Promener Nala x3', 0, '[]', 1),
(6, 'Tondre le gazon', 0, '[\"samedi\"]', 1),
(7, 'Médicaments Hermes', 0, '[\"lundi\",\"mardi\",\"jeudi\",\"vendredi\",\"dimanche\"]', 2),
(8, 'Boire 1.5L', 0, '[]', 2),
(9, 'Méditer 15min', 0, '[\"mardi\",\"mercredi\",\"vendredi\"]', 2),
(10, 'Gratitude x3', 0, '[]', 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `api_token` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `api_token`) VALUES
(1, 'test@habittracker.fr', '[]', '$2y$13$5TYCNxcUrZ/.D17ZvhjZQu5DjLW.mNfjeFeNzCGMOUSid//Ii1N6W', 'dc74efef619919a9970cb0993d3040e55f900bced500ebffee62a3614954725a'),
(2, 'sylvie@mail.com', '[]', '$2y$13$0xZi5.1W00RYSkkOGGqteOcGZf/k9Gk8DXQxcURPO57DNwPXX/JDC', 'b4b4d7097c895084dd861f9b5a36361430884093ad3c52c204a04d72abf06528');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `habit`
--
ALTER TABLE `habit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_44FE21727E3C61F9` (`owner_id`);

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
-- AUTO_INCREMENT pour la table `habit`
--
ALTER TABLE `habit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `habit`
--
ALTER TABLE `habit`
  ADD CONSTRAINT `FK_44FE21727E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);
COMMIT;
