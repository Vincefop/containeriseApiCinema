FROM maven:3.8.4-jdk-11 as BUILD
# Dans cette phase là, je vais construire mon bundle JS
WORKDIR /app
COPY . .
RUN mvn package
# Générer le bundle dans le dossier
RUN

# Deuxième phase qui va construire l'image finale de production
FROM nginx:1.21.5-alpine
WORKDIR /usr/share/nginx/html
COPY --from=Build /app/dist . #lepoint=/usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]