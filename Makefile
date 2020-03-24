SPIGOT_REV := "1.14.4"
JAVA_XMX := "512m"
JAVA_XMS := "512m"

.PHONY: docker
docker: Dockerfile
	docker build --rm -f $< \
		-t pierro777/spigot \
		--build-arg SPIGOT_REV="${SPIGOT_REV}" \
		--build-arg JAVA_XMX="${JAVA_XMX}" \
		--build-arg JAVA_XMS="${JAVA_XMS}" \
		.
	docker tag pierro777/spigot:latest pierro777/spigot:${SPIGOT_REV}

