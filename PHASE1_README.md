For Phase 1 the idea I think would be to have a local install of Docker on a deveoloper's laptop then have a Dockerfile and docker-compose.yml. The developer should be able to run docker-compose using the yaml file, which also references the Dockerfile, which then builds the environment necessary to test the application. Doing this would create a streamlined process to allow any and all devs to pull from the same repo and add changes as necessary.

Below is what I went through for this exercise.

I researched on how to convert java files into .jar files. Seems that it requires creating a class and manifest file. I ran the commands that are under the Phase 1 instructions and ran into an error. Seems that my local install of Java 8 JDK didn't have the necessary tools feature to actualy complete the gradlew build. After some digging online I found that I needed a different version of Java. So then I went to download Java SE Development Kit 17.0.2. I ran the commands again and they were successful. I ran the Docker command and was unable to access the application. I tried a different combination of options such as one dash under p for specifying port and even assigning a specific IP address from which the application can be accessed from. Doing all this I also got a refresher on how to kill a container and remove it via name so I can reuse the name versus having to come up with one everytime or have one randomly generated. In the end I ran out of time in figuring out how to get this to work. I was trying to see how to get the container to work locally so that I can then see how to make it work using docker-compose. 

What I thought about doing, and also tried doing, was creating a Dockerfile with specifics such as FROM, COPY, EXPOSE and ENTRYPOINT to make the process of running the application more seamless. This Dockerfile would be the file that builds the image. Based on what I have read I would then create a docker-compose.yml file and specify which Dockerfile to build the container from. 

I ran into trouble trying to manually build the Dockerfile. Receiving the following message of:

cisco@FZMacbookPro2017 platform-interview % docker build -t bootdocker:1 .
[+] Building 0.1s (1/2)                                                                     
 => [internal] load build definition from Dockerfile                                   0.0s
 => => transferring dockerfile: 2B                                                     0.0s
failed to solve with frontend dockerfile.v0: failed to read dockerfile: open /var/lib/docker/tmp/buildkit-mount787493539/Dockerfile: no such file or directory

prevented me from going further. I looked it up and seems as though I just need to make sure my Docker file was name Dockerfile. I even did a variation of the Docker file using a multi-stage build but that also failed. After going down a bit of a rabbit hole this is where I imposed the 2 hour time limit for phase 1. I labeled each Dockerfile that I tried building as First_Dockerfile and Secondary_Dockerfile.

Below are links that I used in my research. 

https://medium.com/geekculture/docker-basics-and-easy-steps-to-dockerize-spring-boot-application-17608a65f657

https://dzone.com/articles/run-simple-jar-application-in-docker-container-1

https://www.oracle.com/java/technologies/downloads/#java8

https://www.educative.io/edpresso/intro-to-docker-2---docker-compose-and-packaging-a-springboot-app

https://stackoverflow.com/questions/58119958/simple-docker-compose-to-execute-a-jar

https://stackoverflow.com/questions/61108021/gradle-and-docker-how-to-run-a-gradle-build-within-docker-container

https://docs.docker.com/develop/develop-images/multistage-build/

https://github.com/docker/for-win/issues/8781

