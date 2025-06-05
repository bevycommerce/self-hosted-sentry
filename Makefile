.PHONY: install up down wipe reset backup restore
install:
	./install.sh

up:
	docker compose up --build -d

down:
	docker compose down

wipe:
	docker compose down -v

reset:
	docker system prune -a -f && docker volume prune -f

backup:
	docker exec sentry-self-hosted-postgres-1 /usr/bin/pg_dump -U postgres --clean postgres > backup.sql

restore:
	docker cp backup.sql sentry-self-hosted-postgres-1:/tmp/backup.sql
	docker exec sentry-self-hosted-postgres-1 psql -U postgres -d postgres -f /tmp/backup.sql
