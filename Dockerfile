FROM eclipse-temurin:17-jdk-alpine
EXPOSE 8080
ADD /home/runner/work/spring-petclinic/spring-petclinic/target/spring-petclinic-3.3.0-SNAPSHOT.jar  ./springpectclinic.jar
CMD [ "java" , "-jar", "springpectclinic.jar" ]


