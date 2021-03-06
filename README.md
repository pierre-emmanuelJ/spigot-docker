# spigot-docker

A Minecraft Spigot [Docker image](https://hub.docker.com/r/pierro777/spigot) to run [Spigot](https://www.spigotmc.org/) with your own server files very easily.

## Run it with Docker

create a directory (e.g `server-example`), put your `eula.txt`and `server.properties` files inside.

### Optional
If you build the image you can choose the Spigot version by setting `SPIGOT_REV` in env and 
run the `Makefile` e.g(`SPIGOT_REV=1.14.4 make docker`).

### then

```
docker run -p 25565:25565 -e JAVA_XMX=512m -e JAVA_XMS=512m -v $PWD/server-example:/spigot_server  pierro777/spigot:latest
```

All server files are now in the `server-example` directory.


## Run it with Docker-compose

Create a directory `data`, put your `eula.txt`and `server.properties` files inside.

### Optional
In `.env` you can set Java `Xmx` and `Xms` flags value.
If you build the image you can choose the Spigot version by setting `SPIGOT_REV`

### then

```
$docker-compose up -d
```

Enjoy!
