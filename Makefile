SHELL := /bin/bash

.PHONY: up down reset seed psql test run-all

up:
	./scripts/session.sh up

down:
	./scripts/session.sh down

reset:
	./scripts/session.sh reset

seed:
	./scripts/session.sh seed

psql:
	./scripts/session.sh psql

test:
	./scripts/session.sh test

run-all:
	./scripts/session.sh run-all
