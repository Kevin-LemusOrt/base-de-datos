# Contenedores de sistemas gestores de Base de datos

![imagenDocker](/img/docker.png)

## Imagenes

> coamndos para cada imagen

- Descargar imagen de postgres

```
docker pull postgres:14.22-trixie
``` 

- Descargar imagen de tutorial de Docker

```docker
docker pull docker/getting-started:latest
```

## Creacion de contenedores
```docker
docker run -d -p 80:80 ["nombre o codigo de la imagen"]
```

Donde:
- -d detach (backgraud)
- -p puerto (el primero no se cambia, el segundo si se puede cambiar)

## contenedores de tutorial de Docker

docker run -d -p 80:80 docker/getting-started

docker run -d -p 80:81 3e4394f6b72f

#### contenedor de mariaDB sin volumen

```docker
docker run -d --name Server-MariaDBG1 /
-p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456 /
8431e
```

#### contenedor de mariaDB con volumen

```docker
docker volume create v-mariaDBG1
docker run -d --name Server-MariaDBG1 /
-p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456 -v v-mariadbg1:/var/lib/msql /
8431e
```

#### contenedor de postgres con volumen

```
docker volume create v-postgresg1
docker run -d --name Server-PostgresG1 /
-p 5455:5432 -e POSTGRES_PASSWORD=12345 -v v-postgresg1:/var/lib/postgresql/data /
900107

```

#### contenedor de SQLServer con volumen
```
docker volume create v-sqlserverg1
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=12345" \
   -u 0 \
   -p 1450:1433 --name SQLServerG1 \
   -d -v v-sqlserverg1:/var/opt/mssql/data \
   88ac6
```

## comandos de docker

| comando | descripcion |
|----------|----------|
| **docker --version**   | _Muestra la version de Docker_ |
| **docker pull [Nombre de la imagen]**| _Descargar una imagen de dockerHub_ [DockerHub](https://hub.docker.com)   |
| **docker images**| _Muestra las imagenes_   |
| **docker run**   | _Permite crear un contenedor_   |
| **docker ps** | _Visualiza los contenedores que estan en ejecucion_ |
| **docker container ls**| _Visualiza los contenedores que estan en ejecucion_|
| **docker ps -a**|_visualiza todos los contenedore_|
| **docker container -ls -a**| _visualiza todos los contenedores_|
| **docker rm [Nombre del contenedor o id del contenedor]**| _borra el contenedor_|
| **docker run**| _crea un nuevo contenedor_|
| **docker stop [nombre o id]**| _Detiene un contenedor_|
| **docker start [nombre o id]**| _iniciar un contenedor_|
| **docker rm [nombre o id]**| _Elimina un contenedor que no esta en ejecucion_|
| **docker rm -f [nombre o id]**| _Elimina un contenedor que esta en ejecucion_|
| **docker volums ls**| _va a mostrar os volumenes que existen en docker_|
