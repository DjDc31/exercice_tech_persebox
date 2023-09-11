#!/bin/bash

echo "Configuration du fichier .env..."
echo "CLOUDINARY_URL=cloudinary://567375167474919:uA-8w6PHLWxxk4Cxoh1PUG_LyEA@dxe8z0dsb

STRIPE_SECRET_KEY=xxxxxxxxxxxx
STRIPE_PUBLISHABLE_KEY=xxxxxxxxxxxx
STRIPE_SIGNING_SECRET=xxxxxxxxxxxx

SENDGRID_KEY=xxxxxxxxxxxx

GOOGLE_MAPS_API_KEY=xxxxxxxxxxxx
" > .env

echo "Installation des dépendances..."
bundle install

echo "Création de la base de données..."
rails db:create

echo "Exécution des migrations..."
rails db:migrate

echo "Chargement des seed..."
rails db:seed

echo "Lancement du serveur Rails..."
rails s

echo "Ouverture du serveur Rails dans le navigateur..."
sleep 3
start http://localhost:3000
open http://localhost:3000
