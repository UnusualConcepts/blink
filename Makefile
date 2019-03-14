DOCKER_ID = $$(docker ps -a -f name=e2e_test --format {{.ID}})

build:
	gradle build docker -i --rerun-tasks
	echo "$(DOCKER_HUB_PASSWORD)" > sudo docker login --username=2heoh --password-stdin
	docker tag uc/blink 2heoh/blink
	docker push 2heoh/blink

test:
	docker run -d -p ${APP_PORT}:8080 --name e2e_test -t 2heoh/blink:master
	nc -z -v -w1 ${APP_HOST} ${APP_PORT}
	gradle e2eTest -i --rerun-tasks

test2:
	gradle e2eTest -i --rerun-tasks

clean:
	docker stop $(DOCKER_ID)
	docker rm $(DOCKER_ID)

install:
	./install.sh
