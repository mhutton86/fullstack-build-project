## TODO

reset-docker-env:
	"scripts/reset-docker-dev-env.sh"

build-docker-app:
	"scripts/build-docker.sh"

run-docker-env:
	"scripts/run-docker-dev-env.sh"

provision-docker-env:
	"scripts/provision-docker-dev-env.sh"

stop-docker-env:
	"scripts/stop-docker-dev-env.sh"

push-docker-app:
	"scripts/push-docker-app.sh"

test-docker-env:

fresh-start: reset-docker-env build-docker-app run-docker-env provision-docker-env stop-docker-env