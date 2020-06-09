.PHONY: docker
docker: Dockerfile
	docker build --rm -f $< \
		-t pierro777/spigot \
		--build-arg SPIGOT_REV="${SPIGOT_REV}" \
		.
	docker tag pierro777/spigot:latest pierro777/spigot:${SPIGOT_REV}

.PHONY: docker-push
docker-push:
	docker push pierro777/spigot:${SPIGOT_REV}

.PHONY: docker-push-latest
docker-push-latest:
	docker push pierro777/spigot:latest

docker-build-all-version:
	@./build_all.sh

