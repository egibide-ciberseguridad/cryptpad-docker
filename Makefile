#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo ------------------------------------
	@echo start / stop / restart
	@echo build
	@echo workspace
	@echo logs / stats
	@echo clean
	@echo ------------------------------------

_header:
	@echo ---------
	@echo CryptPad
	@echo ---------

_urls: _header
	${info }
	@echo ------------------------------------
	@echo [CryptPad] http://cryptpad.test:3000
	@echo ------------------------------------

_start-command:
	@docker compose up -d --remove-orphans

start: _start-command _urls

stop:
	@docker compose stop

restart: stop start

build:
	@docker compose build

workspace:
	@docker compose exec cryptpad /bin/sh

logs:
	@docker compose logs cryptpad

stats:
	@docker stats

clean:
	@docker compose down -v --remove-orphans
