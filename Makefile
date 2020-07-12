## TODO

reset-docker-env:
	"scripts/reset-docker-dev-env.sh"

build-docker-env:
	"scripts/build-docker.sh"

run-docker-env:
	"scripts/run-docker-dev-env.sh"

provision-docker-env:
	"scripts/provision-docker-dev-env.sh"

stop-docker-env:
	"scripts/stop-docker-dev-env.sh"

test-docker-env:

fresh-start: reset-docker-env build-docker-env run-docker-env provision-docker-env stop-docker-env