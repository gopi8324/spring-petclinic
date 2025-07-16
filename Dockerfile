FROM eclipse-temurin:17-jdk-alpine
EXPOSE 8080
ENV APP_HOME /usr/src/app
ADD ./spring-petclinic/spring-petclinic/target/spring-petclinic-3.3.0-SNAPSHOT.jar  $APP_HOME/springpectclinic.jar
WORKDIR $APP_HOME
CMD [ "java" , "-jar", "springpectclinic.jar" ]


