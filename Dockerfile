# Utilise l'image officielle Node.js comme image de base
FROM node:18-alpine

# Définit le répertoire de travail dans le conteneur
WORKDIR /app

# Copie le fichier package.json et package-lock.json (si existant)
COPY package*.json ./

# Installe les dépendances
RUN npm install

# Copie tout le reste du code dans le répertoire de travail
COPY . .

# Compile l'application React
RUN npm run build

# Installe un serveur HTTP pour servir l'application (ex: serve)
RUN npm install -g serve

# Expose le port 3000
EXPOSE 3000

# Commande pour lancer l'application
CMD ["serve", "-s", "build"]
