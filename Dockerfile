##FROM openjdk:8-jdk-alpine
##VOLUME /tmp
##ARG JAVA_OPTS
##NV JAVA_OPTS=$JAVA_OPTS
##ADD target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar spring-petclinic.jar
##EXPOSE 3000
##ENTRYPOINT exec java $JAVA_OPTS -jar spring-petclinic.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar spring-petclinic.jar

FROM maven:3.6-jdk-11-slim as BUILD
COPY . /src
WORKDIR /src
RUN mvn install -DskipTests

FROM openjdk:11.0.1-jre-slim-stretch
EXPOSE 8080
WORKDIR /app
ARG JAR=spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar

COPY --from=BUILD /src/target/$JAR /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
