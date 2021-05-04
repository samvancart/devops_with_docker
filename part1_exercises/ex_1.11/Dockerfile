FROM openjdk:8
EXPOSE 8080
WORKDIR /usr/src/app
COPY . .

# Wont work on Windows without these lines
RUN apt-get update && apt-get install dos2unix
RUN dos2unix mvnw

RUN ./mvnw package
CMD java -jar target/docker-example-1.1.3.jar
