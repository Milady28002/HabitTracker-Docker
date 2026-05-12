# Habit Tracker - Environnement Docker

## Description

Ce repository contient la configuration Docker permettant de lancer l’application **Habit Tracker** dans un environnement conteneurisé.

L’environnement Docker regroupe :

- le frontend React
- le backend Symfony
- la base de données MySQL / MariaDB
- MongoDB
- les dépendances nécessaires au fonctionnement du projet

L’objectif est de faciliter le développement local, garantir un environnement cohérent et simplifier le lancement du projet.

---

## Services Docker utilisés

| Service | Description |
|---|---|
| Frontend | Application React / Vite |
| Backend | API Symfony |
| MySQL / MariaDB | Base de données relationnelle |
| MongoDB | Base NoSQL pour les statistiques et l’historique |

---

## Technologies utilisées

- Docker
- Docker Compose
- React
- Vite
- Symfony
- PHP
- MySQL / MariaDB
- MongoDB

---

## Structure générale

```txt
habit-tracker/
│
|__ habit-tracker-front/
|__ habit-tracker-api/
|__ docker-compose.yml
|__ README.md
```
--- 

## Lancement du projet

```bash
docker compose up --build
```
Cette commande :

- construit les images Docker
- démarre les containers
- lance l’ensemble de l’environnement

---

## Accès aux services

Frontend React
```
http://localhost:5173
```

Backend Symfony
```
http://localhost:8000
```

MySQL / MariaDB
Port utilisé :
3306

MongoDB
Port utilisé :
27017

---

### Commandes utiles
Arrêter les containers
```bash
docker compose down
```
Reconstruire les images
```bash
docker compose up --build
```
Voir les logs
```bash
docker compose logs
```
Voir les containers actifs
```bash
docker ps
```

---

### Variables d’environnement

Les variables d’environnement sont définies dans les fichiers .env.

Exemple backend :
```
DATABASE_URL="mysql://user:password@database:3306/habit_tracker?serverVersion=10.11"

MONGODB_URL="mongodb://mongo:27017"

MONGODB_DB="habit_tracker"
```

--- 

### Objectifs de la dockerisation

La mise en place de Docker a permis :

- d’uniformiser l’environnement de développement
- d’éviter les problèmes de configuration locale
- de simplifier le lancement du projet
- d’isoler les différents services
- de faciliter les échanges entre frontend, backend et bases de données

---


#### Difficultés rencontrées

Plusieurs problématiques ont été rencontrées pendant la mise en place :

- communication entre containers
- configuration des ports
- connexion entre Symfony et MySQL
- gestion de MongoDB dans Docker
- optimisation des performances sous Docker Desktop Windows (lenteurs)


Ces problèmes ont été résolus via :

- la configuration du réseau Docker
- l’utilisation des noms de services Docker dans les connexions
- l’optimisation des appels API et des requêtes MongoDB
- Optimisations réalisées


Des optimisations ont été mises en place afin d’améliorer les performances :

- réduction des appels API inutiles
- suppression de requêtes MongoDB répétitives
- optimisation du chargement des habitudes
- amélioration des temps de réponse du backend

---

### Auteur
Projet réalisé par Sylvie
Formation Graduate Développeur Web Full Stack