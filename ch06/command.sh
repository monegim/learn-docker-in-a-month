#!/bin/bash
docker run --name f1 diamol/ch06-file-display
echo "http://eltonstoneman.com" > url.txt
docker container cp url.txt f1:/input.txt
docker container start --attach f1

docker container run --name f2 diamol/ch06-file-display
docker container rm -f f1
docker container cp f1:/input.txt .

docker container run --name todo1 -d -p 8010:80 diamol/ch06-todo-list
docker container inspect --format '{{.Mounts}}' todo1
docker volume ls