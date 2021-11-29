## build only
FROM maven:3.8.4-openjdk-17-slim as build

ARG APP_DIR=/app

WORKDIR ${APP_DIR}

COPY . .

RUN mvn clean install -DskipTests -B

## run only

FROM maven:3.8.4-openjdk-17-slim

ENV APP_DIR=/app PORT=3000

WORKDIR ${APP_DIR}

COPY --from=build ${APP_DIR}/target/dovbear-0.0.1-SNAPSHOT.jar ./app.jar

EXPOSE ${PORT}

ENTRYPOINT exec java -jar /app/app.jar