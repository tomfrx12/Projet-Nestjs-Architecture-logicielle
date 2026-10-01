.PHONY: up down logs shell tools async prisma-generate prisma-migrate test reset

up:
	docker compose up --build -d

down:
	docker compose down

logs:
	docker compose logs -f app

shell:
	docker compose exec app sh

tools:
	docker compose --profile tools up -d

async:
	docker compose --profile async up -d redis

prisma-generate:
	docker compose exec app npx prisma generate

prisma-migrate:
	docker compose exec app npx prisma migrate dev

test:
	docker compose exec app npm test

reset:
	docker compose down -v
