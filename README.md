# Starter - Projet Architecture NestJS + Prisma

## Démarrage

```bash
cp .env.example .env
docker compose up --build -d
docker compose logs -f app
```

API : http://localhost:3000/api/health

Réponse attendue :

```json
{"status":"ok"}
```

## Base de données

PostgreSQL est disponible dans le réseau Docker sous le nom `db:5432`.

Depuis la machine hôte : `localhost:5432`.

### Prisma

Après avoir défini les premiers modèles dans `prisma/schema.prisma` :

```bash
docker compose exec app npx prisma migrate dev --name init
docker compose exec app npx prisma generate
```

## Outils optionnels

### Adminer + Mailpit

```bash
docker compose --profile tools up -d
```

- Adminer : http://localhost:8080
- Mailpit : http://localhost:8025
- SMTP Mailpit depuis les conteneurs : `mailpit:1025`

### Redis

Redis n'est PAS nécessaire au démarrage.

A activer que si un besoin architectural le justifie.

```bash
docker compose --profile async up -d redis
```

## Important pour le projet

Le starter ne fournit volontairement :

- aucun découpage d'architecture
- aucun module métier
- aucun repository
- aucun modèle Prisma
- aucun Command/Query/Handler
- aucune règle métier.

Ces choix font partie du travail demandé.

Le package `@nestjs/cqrs` est installé mais son utilisation n'est pas obligatoire. 

Vous devez justifier les patterns retenus et éviter d'ajouter de la complexité sans besoin réel.

Pour utiliser le `Makefile`, il faut installer https://gnuwin32.sourceforge.net/packages/make.htm