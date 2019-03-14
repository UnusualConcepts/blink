DOCKER_ID = $$(docker ps -a -f name=e2e_test --format {{.ID}})

build:
	gradle build docker -i --rerun-tasks
	echo "$(DOCKER_HUB_PASSWORD)" > sudo docker login --username=2heoh --password-stdin
	docker tag uc/blink 2heoh/blink
	docker push 2heoh/blink

test:
	make docker-clean-test
	docker run -d -p ${APP_PORT}:8080 --name e2e_test -t 2heoh/blink:master
	./check_service.sh
	gradle e2eTest -i --rerun-tasks
	make docker-clean-test

docker-clean-test:
	docker stop $(DOCKER_ID) || true && docker rm $(DOCKER_ID) || true

install:
	./install.sh
