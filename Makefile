DOCKER_ID = $$(docker ps -a -f name=e2e_test --format {{.ID}})

build:
	./gradlew build docker -i --rerun-tasks
	echo "$(DOCKER_HUB_PASSWORD)" | docker login -u 2heoh --password-stdin
	docker tag uc/blink 2heoh/blink
	docker push 2heoh/blink

test:
	make docker-clean-test
	if [ -z "$(APP_HOST)" ]; then echo "ERROR: APP_HOST is not set" && false; fi
	if [ -z "$(APP_PORT)" ]; then echo "ERROR: APP_PORT is not set" && false; fi
	docker run -d -p $(APP_PORT):8080 --name e2e_test -t 2heoh/blink:master
	./check_service.sh http://$(APP_HOST):$(APP_PORT)
	gradle e2eTest -i --rerun-tasks
	make docker-clean-test

docker-clean-test:
	if [ ! -z "$(DOCKER_ID)" ]; then docker stop $(DOCKER_ID) || true && docker rm $(DOCKER_ID) || true; fi

install:
	./install.sh
