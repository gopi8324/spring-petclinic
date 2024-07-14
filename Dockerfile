FROM amazoncorretto:11-alpine3.17-jdk
LABEL authour="Gopi"
LABEL project="Springpectclinic"
RUN curl https://github.com/gopi8324/Springpectclinic
EXPOSE 8080
CMD [ "java", "jar", "Springpectclinic"]