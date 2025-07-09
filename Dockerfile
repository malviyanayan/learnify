# Use official Tomcat image
FROM tomcat:9.0

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your web app folder into Tomcat's webapps directory
COPY ./learnify /usr/local/tomcat/webapps/learnify
