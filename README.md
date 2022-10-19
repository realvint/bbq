## Шашлыки

### Описание

Приложение для управления событиями, в котором вы можете создавать события, подписываться на них, комментировать их, прикреплять фотографии, ограничивать к ним доступ.

Создано на версии Ruby 3.0.3, Rails 6.1

Язык: Русский.

### Запуск

1. Нужно установить в Gem файле нужную версию Руби и установить соответствующую версию в систему например rbenv install 3.0.2 и изменить для проекта командой 

```console
$ rbenv local 3.0.2
```


2. Изменить версию базы данных в гем файле на ту, что у вас есть в системе. Например

```console
$ gem 'sqlite3', '~> 1.4'
```

3. Установить гем  Magic

```console
$ sudo apt-get install imagemagick libmagickwand-dev
```

4. Установить мэнеджер проектов yarn

```console
$ yarn install
```

5. Обновить библиотеки

```console
$ bundle update
```

6. Настроить подключение к БД в database.yml по шаблону database.yml.sample

<https://gist.github.com/mmizutani/5a2d84cc438675d3bcbfd9cc59de53ba>


7. Cоздать базу данных

```console
$ rails db:create
```

8. Прогнать миграции

```console
$ rails db:migrate
```

9. Запустить сервер командой

```console
$ rails server
```