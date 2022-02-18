#syntax=docker/dockerfile:1
# Container used for building springboot app 
FROM gradle:5.3.0-jdk-aplpine AS PLATFORM_INTERVIEW
ENV APP_HOME=/usr/app
WORKDIR $APP_HOME
COPY build.gradle settings.gradle $APP_HOME

COPY gradle $APP_HOME/gradle
COPY --chown=gradle:gradle . /home/gradle/src
USER root
RUN chown -R gradle /home/gradle/src

RUN gradle build || return 0
COPY . . 
RUN gradle clean build

# container 
FROM adoptopenjdk/openjdk11:alpine-jre
ENV ARTIFACT_NAME=$APP_HOME//Users/cisco/Documents/github/loanstreet-interview/platform-interview/build/libs/platform-interview-0.0.1-SNAPSHOT.jar
ENV APP_HOME=/usr/app/

WORKDIR $APP_HOME
COPY --from=TEMP_BUILD_IMAGE $APP_HOME/build/libs/$ARTIFACT_NAME .

EXPOSE 8080
ENTRYPOINT exec java -jar ${ARTIFACT_NAME}}