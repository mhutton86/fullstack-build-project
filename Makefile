## This Makefile defines the commands needed to build, execute, and clean-up the docker environment

reset-docker-env:
	"scripts/docker-reset-dev-env.sh"

build-docker-app:
	"scripts/docker-build.sh"

run-docker-env:
	"scripts/docker-run-dev-env.sh"

provision-docker-env:
	"scripts/docker-provision-dev-env.sh"

stop-docker-env:
	"scripts/docker-stop-dev-env.sh"

push-docker-app:
	"scripts/docker-push-app.sh"

lint-app:
	docker run --rm -i hadolint/hadolint < Dockerfile

test-docker-env: run-docker-env
	"scripts/docker-test-rails.sh"

fresh-start: reset-docker-env build-docker-app run-docker-env provision-docker-env stop-docker-env