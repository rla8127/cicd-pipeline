FROM openjdk:11.0
COPY spring-petclinic.jar spring-petclinic.jar
ENTRYPOINT ["java","-jar","/spring-petclinic.jar"]COPY
