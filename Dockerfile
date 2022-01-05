FROM openjdk:11 as Build
# Dans cette phase là, je vais construire mon bundle JS
WORKDIR /usr/src/myapp
COPY . /usr/src/myapp
RUN javac src/main/java/fr/semifir/apicinema/ApiCinemaApplication.java
# Générer le bundle dans le dossier
RUN -it --rm --name my-running-app my-java-app

# Deuxième phase qui va construire l'image finale de production
FROM nginx:1.21.5-alpine
WORKDIR /usr/share/nginx/html
COPY --from=Build /app/dist . #lepoint=/usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]