FROM node:16.13.1-alpine3.15 as Build
# Dans cette phase là, je vais construire mon bundle JS
WORKDIR /app
COPY . .
RUN npm intall
# Générer le bundle dans le dossier dist
RUN npm run build

# Deuxième phase qui va construire l'image finale de production
FROM nginx:1.21.5-alpine
WORKDIR /usr/share/nginx/html
COPY --from=Build /app/dist . #lepoint=/usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]