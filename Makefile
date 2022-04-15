# Запуск приложения для разработки
app-start: app-build app-up

app-build: # сборка проекта с указанием имени пользователя
	docker-compose build
app-build-no-cache: # сборка без кэша
	docker-compose build --no-cache
app-up: # запуск проекта
	docker-compose up -d
app-stop: # остановка проекта
	docker-compose stop
app-down: # удаление контейнеров проекта
	docker-compose down

### Команды для работы с контейнерами приложения
exec-php-fpm: # заходим в контейнер с php
	docker-compose exec autodrive-php-fpm bash
exec-percona: # заходим в контейнер с redis
	docker-compose exec autodrive-percona bash

### Копирование зависимостей локально из контейнера
rm-vendor:
	rm -rf ./vendor
load-vendor:
	rm -rf ./vendor
	docker cp autodrive-php-fpm:/var/www/vendor/. ./vendor
