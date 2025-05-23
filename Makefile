.PHONY: db-up
db-up:
	docker compose up -d

.PHONY: db-down
db-down:
	docker compose down

.PHONY: db-down-clean
db-down-clean:
	docker compose down --volumes --remove-orphans

.PHONY: db-logs
db-logs:
	docker compose logs -f

.PHONY: db-shell
db-shell:
	docker compose exec db bash

.PHONY: run
run:
	bin/dev

.PHONY: create
create:
	bin/rails db:create

.PHONY: migrate
migrate:
	bin/rails db:migrate

.PHONY: test
test:
	bundle exec rspec
