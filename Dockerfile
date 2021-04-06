FROM maven:3.6.3-jdk-11 as build

COPY . .

RUN apt-get update && apt-get install -y wget

RUN mvn install -DskipTests

ENV DOCKERIZE_VERSION v0.6.1

RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

FROM openjdk:11-slim

WORKDIR /app

COPY --from=build ./.docker/starterapp/application.properties .

COPY --from=build /target/*.jar app.jar

COPY --from=build /.docker/starterapp/starterapp.entrypoint.sh .

COPY --from=build /usr/local/bin/dockerize .

RUN chmod +x starterapp.entrypoint.sh \
    && chmod +x dockerize

EXPOSE 8080
