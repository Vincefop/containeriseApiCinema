FROM node:16.13.1-alpine3.15 as Build
# Dans cette phase là, je vais construire mon bundle JS
WORKDIR /app
COPY . .
RUN npm intall
# Générer le bundle dans le dossier dist


# Deuxième phase qui va construire l'image finale de production
