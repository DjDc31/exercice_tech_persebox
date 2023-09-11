# Persebox.com

Persebox.com est une application web de vente de boîtes de produits pour collectionneurs et revendeurs. Que vous soyez un collectionneur de cartouches de Game Boy, de consoles PlayStation, de maroquinerie de grandes marques ou de tout autre objet de collection, vous êtes au bon endroit !

## Prérequis

Assurez-vous d'avoir Ruby et Rails installés sur votre machine.
Git doit également être installé.

## Mise en place

Pour installer et configurer le projet sur votre machine locale, suivez les étapes suivantes :
1. Clonage du dépôt
bash
Copy code
git clone git@github.com:DjDc31/exercice_tech_persebox.git
cd exercice_tech_persebox

2. Exécution du script d'installation
bash
Copy code
./install.sh
Ce script va :
. Créer un fichier .env avec vos variables d'environnement.
. Installer toutes les dépendances nécessaires.
. Créer la base de données.
. Exécuter les migrations.
. Charger les données initiales (seeds).

3. Ouvrir dans le navigateur
Une fois que le script s'est exécuté, votre navigateur par défaut devrait s'ouvrir et vous diriger vers http://localhost:3000.

## Avertissement

Pour des raisons de sécurité, seul la clé API de Cloudinary sera fourni pour ce délivrable. Les clés Stripe, Sendgrid et Google_maps ne seront pas fournis à cet occasion.
Des fonctionnalités comme l'inscription d'un nouvelle utilisateur, le paiement, la page de paiement, ... peuvent donc fortement présenter des erreurs au chargement.

## Contribution

Si vous rencontrez des problèmes ou si vous avez des suggestions, n'hésitez pas à ouvrir une issue ou à soumettre une pull request.



TUTO INSTAL :
chmod +x install.sh

echo "CLOUDINARY_URL=cloudinary://567375167474919:uA-8w6PHLWxxk4Cxoh1PUG_LyEA@dxe8z0dsb

STRIPE_SECRET_KEY=xxxxxxxxxxxx
STRIPE_PUBLISHABLE_KEY=xxxxxxxxxxxx
STRIPE_SIGNING_SECRET=xxxxxxxxxxxx

SENDGRID_KEY=xxxxxxxxxxxx

GOOGLE_MAPS_API_KEY=xxxxxxxxxxxx
" > .env


Installer les dépendances :
bundle install

Créer la base de données :

rails db:create
Exécuter les migrations :
rails db:migrate
Charger les seed :
rails db:seed

lancement de rails s
