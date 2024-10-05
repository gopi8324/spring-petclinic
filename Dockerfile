FROM eclipse-temurin:17-jdk-alpine
EXPOSE 8080
ENV APP_HOME /usr/src/app
COPY target/*.jar  $APP_HOME/springpectclinic.jar
WORKDIR $APP_HOME
CMD [ "java" , "-jar", "springpectclinic.jar" ]


