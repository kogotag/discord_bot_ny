FROM openjdk:11
ENV PROJECT_NAME=discord_bot_ny
WORKDIR /app/build
COPY src ./src
COPY gradle ./gradle
COPY build.gradle .
COPY settings.gradle .
COPY gradlew .
RUN chmod -R +x .
RUN ./gradlew --version
RUN ./gradlew customFatJar
WORKDIR /app
RUN mv build/build/libs/$PROJECT_NAME-1.0.jar app.jar\
 && rm -Rf build
RUN chmod -R +x .
CMD java -jar app.jar