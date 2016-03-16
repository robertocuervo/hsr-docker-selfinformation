FROM maven:3.2-jdk-7-onbuild

WORKDIR /app

# Add POM and source
ADD pom.xml /app/pom.xml
ADD src /app/src
ADD war /app/war

# Build the app
RUN ["mvn", "clean", "package"]

# Run the app
RUN bash -c 'touch /app/target/informationservlet-1.0-SNAPSHOT-jar-with-dependencies.jar'
ENTRYPOINT ["java","-cp","/app/target/informationservlet-1.0-SNAPSHOT-jar-with-dependencies.jar","ch.hsr.pl.Main"]
