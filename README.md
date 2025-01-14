# Projet intégration continu  

Ce projet a pour objectif de déployer un serveur git sur WSL, avec une interface web accessible depuis Windows et hors internet, et de déployer un outil d'intégration continue permettant d'avoir des tests de non-régression.


## Installation Gitlab

Après avoir récupéré le fichier deployment.sh, executer le sur votre machine Debian :
```bash
    ./deployment.sh
```
Après quelques installations, on va vous demander d'ajouter l'adresse IP et l'url dans votre fichier host avant de rentrer "ok". 
Pour cela : 
- Aller dans C/Windows/System32/drivers/etc/ 
- Ouvrer le fichier host en tant qu'administrateur 
- Ajouter à la fin du fichier : 127.0.0.1 maellesite.com 
- Vous pouvez ensuite valider avec "ok" sur la console de la debian


## Connection au Gitlab

Nous allons nous connecter au gitlab hors internet, pour ceci, sur votre navigateur taper dans la barre de recherche : maellesite.com

Vous allez arriver sur la page de connexion, où vous pouvez vous connecter avec : 
- username : root
- password : fYT69ntf4vo9Jr4L

La prochaine étape est d'importer le projet python sur Gitlab et d'y importer le fichier :
- .gitlab-ci.yml 
- Penser à changer le chemin du fichier gaussian_sum_formula.py à la ligne 15


## Installation de Gitlab Runner

L'étape suivante est de créer un runner sur Gitlab, le script va s'arreter et vous demander de remplir le token du runner. Voici comment créer un runner sur Gitlab :
- Aller dans "Admin Area" en bas à gauche de votre écran
- Dans la rubrique "CI/CD" aller dans "Runners"
- Cliquer sur "New Instance Runner" en haut à droite 
- Dans "Platform" : "Operating system" choisissez "Linux"
- Dans "Tags" : cocher "Run untagged jobs"
- Valider en bas de la page avec "Create runner"
- Vous pouvez ensuite récupérer le token lui appartenant, il est dans STEP 1 (runner authentication token) et le copier dans la console de la Debian

Il suffit ensuite de faire entrer pour valider chacune des étapes car les informations demandées sont déjà entrées, ce qui va configuré le runner sur la Debian.
Pour terminé le script va installé les autres paquets utiles comme Python3 ou Pylint.

Lorsque le script sera terminé il vous affichera "Installation terminée".
