FROM openjdk:11
COPY target/calculator-0.0.1-SNAPSHOT-jar-with-dependencies.jar
WORKDIR ./
CMD ["java", "-jar", "calculator-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]