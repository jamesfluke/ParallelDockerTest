#Dockerfile to create a JDK Alpine Image with bash
FROM openjdk:8-jdk-alpine

# Update Alpine Linux Package Manager and Install the bash
RUN apk update && apk add bash

# Run the bash terminal on container startup
CMD /bin/bash