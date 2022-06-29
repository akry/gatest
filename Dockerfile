FROM amazoncorretto:11 AS spring_layers_extract
WORKDIR /app
COPY ./build/libs/*.jar app.jar
RUN java -Djarmode=layertools -jar app.jar extract

FROM amazoncorretto:11
WORKDIR /app
COPY --from=spring_layers_extract app/dependencies/ ./
RUN true
COPY --from=spring_layers_extract app/spring-boot-loader/ ./
RUN true
COPY --from=spring_layers_extract app/snapshot-dependencies/ ./
RUN true
COPY --from=spring_layers_extract app/application/ ./
RUN true

EXPOSE 8080
ENTRYPOINT [ "java", "org.springframework.boot.loader.JarLauncher" ]
 
