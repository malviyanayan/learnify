FROM tomcat:9.0

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY ./ROOT /usr/local/tomcat/webapps/ROOT
COPY ./elp /usr/local/tomcat/webapps/elp
