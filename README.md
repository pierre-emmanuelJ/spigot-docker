# spigot-docker

A docker image to run [Spigot](https://www.spigotmc.org/) with your own server files very easily.

## Run it

create a directory (e.g `server-example`), put your `eula.txt`and `server.properties` files inside.

then

```
docker run -p 25565:25565 -v $PWD/server-example:/spigot_server  pierro777/spigot:latest
```

All server files are now in the `server-example` directory.

Enjoy!
