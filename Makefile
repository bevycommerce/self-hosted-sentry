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
	./scripts/backup.sh

restore:
	./scripts/restore.sh
