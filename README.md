# Persebox.com

Persebox.com est une application web de vente de boîtes de produits pour collectionneurs et revendeurs. Que vous soyez un collectionneur de cartouches de Game Boy, de consoles PlayStation, de maroquinerie de grandes marques ou de tout autre objet de collection, vous êtes au bon endroit !

## Le Projet : 
- [Lien du projet](http://localhost:3000/products?sort=price_asc&commit=trier)
- Un UX/UI inspiré des plus grands, notamment de [stockX](https://stockx.com/fr-fr/search/sneakers?s=lo).
- Un design responsive
- Des formulaires de recherche équipés de l'auto-complete
- Les tests RSpec

## Prérequis

Assurez-vous d'avoir Ruby et Rails installés sur votre machine.
Git doit également être installé.

## Mise en place

Pour installer et configurer le projet sur votre machine locale, suivez les étapes suivantes :
1. Clonage du dépôt

```shell
git clone git@github.com:DjDc31/exercice_tech_persebox.git
cd exercice_tech_persebox
```
2. Exécution du script d'installation

```shell
./install.sh
```

Ce script va :
- Créer un fichier .env avec vos variables d'environnement.
- Installer toutes les dépendances nécessaires.
- Créer la base de données.
- Exécuter les migrations.
- Charger les données initiales (seeds).

3. Ouvrir dans le navigateur
Une fois que le script s'est exécuté, votre navigateur par défaut devrait s'ouvrir et vous diriger vers http://localhost:3000.

4. Lancer les Tests

Vous pouvez maintenant lancer les tests permettant de confirmer la bonne mise en place de la pagination dans l'index:

```shell
rspec
```

## Avertissement

Pour des raisons de sécurité, seul la clé API de Cloudinary sera fournie pour ce délivrable. Les clés Stripe, Sendgrid et Google_maps ne seront pas fournies à cet occasion. Des fonctionnalités comme l'inscription d'un nouvel utilisateur, le paiement, la page de paiement, etc. peuvent donc fortement présenter des erreurs au chargement.

## Contribution

Si vous rencontrez des problèmes ou si vous avez des suggestions, n'hésitez pas à ouvrir une issue ou à soumettre une pull request.





### En cas de difficulté avec l'installation automatique :

Vous pouvez aussi installer le site manuellement en collant ce code dans votre terminal :
```shell
#Installer les dépendances
bundle install

#Créer la base de données
rails db:create

#Exécuter les migrations
rails db:migrate

#Charger les seeds
rails db:seed

#lancement
rails s
```
