FROM maven:3.6.1-jdk-8 as mavenbuild
WORKDIR /dir1
COPY . .
RUN mvn package

FROM tomcat:9.0
COPY --from=mavenbuild /dir1/target/mvn-hello-world.war /usr/local/tomcat/webapps 
