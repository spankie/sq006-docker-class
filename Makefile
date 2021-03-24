dev:
	mvn spring-boot:run -Dspring-boot.run.profiles=dev

prod:
	./mvnw spring-boot:run -Dspring-boot.run.profiles=prod

deploy:
	./mvnw -DskipTests package appengine:deploy

logs:
	gcloud app logs tail -s default

test:
	./mvnw test -Dspring.profiles.active=test

run:
	docker container rm demo-container
	docker run -t -i -d -p 9090:8080 --name demo-container sq006-demo

build:
	docker build . -t sq006-demo

build-dep:
	docker build . -t demo-dep -f Dockerfile-dep

log:
	docker logs demo-container -f

compose: build-dep
	docker-compose up --build 