# Use an official Ubuntu image as the base image
FROM ubuntu:22.04

# Install necessary packages and set up environment
RUN apt-get update && \
    apt-get install -y \
    wget \
    unzip \
    
    # install some helper tools    
    procps curl git nano \

    # install jdk
    openjdk-21-jdk && \

    # Install Gradle
    wget https://services.gradle.org/distributions/gradle-8.3-bin.zip -O /tmp/gradle.zip && \
    unzip /tmp/gradle.zip -d /opt && \
    rm /tmp/gradle.zip && \
    ln -s /opt/gradle-8.3/bin/gradle /usr/bin/gradle && \

    # Clean up to reduce image size
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for Gradle
ENV GRADLE_HOME=/opt/gradle-8.3
ENV PATH=${PATH}:${GRADLE_HOME}/bin

# Verify the installation
RUN java -version
RUN gradle -v

# setup ssh access
EXPOSE 80
EXPOSE 443

# expose spring boot server port
EXPOSE 8080

# Set the working directory
WORKDIR /app

# copy all files in the repo to the container
COPY ../ .

# build the java app
RUN gradle build

# Keep the container running while not 
# binding its life cycle to the java app
CMD ["tail", "-f", "/dev/null"]

