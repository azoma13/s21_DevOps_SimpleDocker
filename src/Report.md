## Part 1. Готовый докер

- Возьми официальный докер-образ с nginx и выкачай его при помощи docker pull.

![alt text](png/image.png)
- Проверь наличие докер-образа через docker images.

![alt text](png/image-1.png)

- Запусти докер-образ через docker run -d [image_id|repository].

![alt text](png/image-2.png)

- Проверь, что образ запустился через docker ps.

![alt text](png/image-3.png)

- Посмотри информацию о контейнере через docker inspect [container_id|container_name].

![alt text](png/image-7.png)

![alt text](png/image-5.png)

![alt text](png/image-6.png)

![alt text](png/image-4.png)

- По выводу команды определи и помести в отчёт размер контейнера, список замапленных портов и ip контейнера.

![alt text](png/image-9.png)

![alt text](png/image-10.png)

![alt text](png/image-11.png)

- Останови докер образ через docker stop [container_id|container_name].

![alt text](png/image-12.png)

- Проверь, что образ остановился через docker ps.

![alt text](png/image-13.png)

- Запусти докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду run.

![alt text](png/image-14.png)

- Проверь, что в браузере по адресу localhost:80 доступна стартовая страница nginx.

![alt text](png/image-15.png)

- Перезапусти докер контейнер через docker restart [container_id|container_name].

![alt text](png/image-17.png)

- Проверь любым способом, что контейнер запустился. 

![alt text](png/image-18.png)

## Part 2. Операции с контейнером

- Прочитай конфигурационный файл nginx.conf внутри докер контейнера через команду exec.

![alt text](png/image-8.png)

- Создай на локальной машине файл nginx.conf.

![alt text](png/image-16.png)

- Настрой в нем по пути /status отдачу страницы статуса сервера nginx.

![alt text](png/image-20.png)

- Скопируй созданный файл nginx.conf внутрь докер-образа через команду docker cp.

![alt text](png/image-21.png)

- Перезапусти nginx внутри докер-образа через команду exec.

![alt text](png/image-22.png)

- Проверь, что по адресу localhost:80/status отдается страничка со статусом сервера nginx.

![alt text](png/image-23.png)

- Экспортируй контейнер в файл container.tar через команду export.

![alt text](png/image-24.png)

- Останови контейнер.

![alt text](png/image-25.png)

- Удали образ через docker rmi [image_id|repository], не удаляя перед этим контейнеры.

![alt text](png/image-26.png)

- Удали остановленный контейнер.

![alt text](png/image-27.png)

- Импортируй контейнер обратно через команду import.

![alt text](png/image-28.png)

- Запусти импортированный контейнер.

![alt text](png/image-29.png)

- Проверь, что по адресу localhost:80/status отдается страничка со статусом сервера nginx.

![alt text](png/image-30.png)

## Part 3. Мини веб-сервер

- Напиши мини-сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!.

![alt text](png/image-33.png)

- Запусти написанный мини-сервер через spawn-fcgi на порту 8080.

![alt text](png/image-32.png)

- Напиши свой nginx.conf, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080.

![alt text](png/image-34.png)

- Проверь, что в браузере по localhost:81 отдается написанная тобой страничка.

![alt text](png/image-31.png)

## Part 4. Свой докер

- Собери написанный докер-образ через docker build при этом указав имя и тег.

    - Dockerfile 
    
    ![alt text](png/image-39.png)

    - Build
    
    ![alt text](png/image-37.png)

- Проверь через docker images, что все собралось корректно.

![alt text](png/image-38.png)

- Запусти собранный докер-образ с маппингом 81 порта на 80 на локальной машине и маппингом папки ./nginx внутрь контейнера по адресу, где лежат конфигурационные файлы nginx'а (см. Часть 2).

![alt text](png/image-36.png)

- Проверь, что по localhost:80 доступна страничка написанного мини сервера.

![alt text](png/image-35.png)

- Допиши в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx.

![alt text](png/image-41.png)

- Перезапусти докер-образ. Если всё сделано верно, то, после сохранения файла и перезапуска контейнера, конфигурационный файл внутри докер-образа должен обновиться самостоятельно без лишних действий

![alt text](png/image-40.png)

- Проверь, что теперь по localhost:80/status отдается страничка со статусом nginx

![alt text](png/image-42.png)

## Part 5. Dockle

- Просканируй образ из предыдущего задания через dockle [image_id|repository].

![alt text](png/image-43.png)

- Исправь образ так, чтобы при проверке через dockle не было ошибок и предупреждений.

    - Способы иправления ошибок

    ![alt text](png/image-46.png)

    ![alt text](png/image-45.png)

    ![alt text](png/image-44.png)

    - Результат 

    ![alt text](png/image-47.png)

## Part 6. Базовый Docker Compose

Напиши файл docker-compose.yml, с помощью которого:

1) Подними докер-контейнер из Части 5 (он должен работать в локальной сети, т.е. не нужно использовать инструкцию EXPOSE и мапить порты на локальную машину).

![alt text](png/image-48.png)

2) Подними докер-контейнер с nginx, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера. Замапь 8080 порт второго контейнера на 80 порт локальной машины.

![alt text](png/image-49.png)

Останови все запущенные контейнеры.

![alt text](png/image-50.png)

Собери и запусти проект с помощью команд docker-compose build и docker-compose up.

![alt text](png/image-51.png)

![alt text](png/image-52.png)

Проверь, что в браузере по localhost:80 отдается написанная тобой страничка, как и ранее.

![alt text](png/image-53.png)