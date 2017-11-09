## Asterisk app in docker

 - Минималистичный, но полнофункциональный asterisk + PostgreSQL + Realtime configuration
 - Для просмотра и редактирования таблиц в базе пока используется adminer
 - Пока ведётся разработка, проект ещё не закончен

## Способы установки

### Простой способ (docker-compose)
1. У вас должен быть установлен [docker](https://docs.docker.com/engine/installation/), [docker-compose](https://docs.docker.com/compose/install/) и git

2. Скачиваем репозиторий:
```
$ git clone https://github.com/BlackoJack/asterisk.git asterisk
$ cd asterisk
```

3. 
      - Открываем `postgres.env`, если хотим меняем пользователя, имя базы, пароль и возможно хост, если хотим использовать сторонний Postgres сервер.
      - Открываем `asterisk.env`, меняем Домен на свой.
      - Если нужно поменять Timezone или Lang, открываем `system.env` и меняем.

4. Запускаем сервис:
```
$ docker-compose up -d
```
