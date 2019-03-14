DOCKER_ID = $$(docker ps -a -f name=e2e_test --format {{.ID}})

build:
	gradle build docker
	echo "$(DOCKER_HUB_PASSWORD)" > sudo docker login --username=2heoh --password-stdin
	docker tag uc/blink 2heoh/blink
	docker push 2heoh/blink

test:
	docker run -d -p 8088:8080 --name e2e_test -t 2heoh/blink:master
	nc -z -v -w1 localhost 8088
	gradle build e2eTest

clean:
	docker stop $(DOCKER_ID)
	docker rm $(DOCKER_ID)


install:
	./install.sh

