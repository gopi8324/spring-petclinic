FROM amazon/aws-lambda-nodejs:10
LABEL authour="Gopi"
LABEL project="Springpectclinic"
RUN curl https://github.com/gopi8324/strapi.git
EXPOSE 1337
CMD [ "node", "start.js", "strapi.git"]