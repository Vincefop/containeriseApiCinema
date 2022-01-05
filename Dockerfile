FROM maven:3.8.4-jdk-11 as BUILD
# Dans cette phase là, je vais construire mon bundle JS
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:11

WORKDIR /app

COPY --from=BUILD /app/target/apiCinema-0.0.1-SNAPSHOT.jar ./app.jar

EXPOSE 8090

CMD ["java", "-jar", "app.jar"]