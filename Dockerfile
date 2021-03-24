# second stage build
FROM demo-dep

WORKDIR /usr/app

COPY ./ /usr/app

ENTRYPOINT [ "mvn", "spring-boot:run" ]