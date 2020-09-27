## This Makefile defines the commands needed to build, execute, and clean-up the docker environment

reset-docker-env:
	"scripts/docker/docker-reset-dev-env.sh"

build-docker-app:
	"scripts/docker/docker-build.sh"

run-docker-env:
	"scripts/docker/docker-run-dev-env.sh"

provision-docker-env:
	"scripts/docker/docker-provision-dev-env.sh"

stop-docker-env:
	"scripts/docker/docker-stop-dev-env.sh"

push-docker-app:
	"scripts/docker/docker-push-app.sh"

lint-app:
	docker run --rm -i hadolint/hadolint < Dockerfile

test-docker-env: run-docker-env
	"scripts/docker/docker-test-rails.sh"

update-k8-cluster:
	"scripts/k8/k8-apply-config.sh"

fresh-start: reset-docker-env build-docker-app run-docker-env provision-docker-env stop-docker-env