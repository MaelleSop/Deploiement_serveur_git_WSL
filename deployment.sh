#!/bin/bash

#INSTALLATION GITLAB
#installation dependances
sudo apt update
sudo apt-get install -y ca-certificates curl openssh-server perl

#installation gitlab
cd /tmp
curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh
sudo bash /tmp/script.deb.sh
sudo GITLAB_ROOT_PASSWORD="fYT69ntf4vo9Jr4L" EXTERNAL_URL="http://maellesite.com" apt install gitlab-ce

#ajoute ip et url dans fichier C/Windows/System32/drivers/etc/hosts
echo "Il faut que vous ajoutiez dans votre fichier host : adresse IP et url (suivre le readme). Lorsque cela est fait, entrer : ok"
read reponse
if test $reponse == "ok"
then
	#lancer gitlab
	nohup sudo /opt/gitlab/embedded/bin/runsvdir-start &
	pid=$!
	sleep 10
	kill -9 $pid
	sudo gitlab-ctl start

	#INSTALLATION GITLAB RUNNER
	curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
	sudo apt-get install gitlab-runner

	#donner les permissions d'executions
        chmod +x gitlab-runner

	echo "Après avoir créé un runner sur Gitlab (suivre le readme), entrer la valeur du token :"
	read reponse2
	sudo gitlab-runner register  --url http://maellesite.com  --token $reponse2 --executor shell

	#lancer le runner
	sudo gitlab-runner start

	#INSTALLATIONS SUPPLEMENTAIRES
	sudo apt-get install python3
	sudo apt-get install python3-pip
	pip install pylint

	echo "Installation terminée"
else
	echo "erreur"
fi
