FROM eclipse-temurin:17-jdk-alpine
EXPOSE 8080
ADD springpetclinic.jar  ./springpectclinic.jar
CMD [ "java" , "-jar", "springpectclinic.jar" ]


