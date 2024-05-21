# -todo-script

Structure du programme :
Le script commence par afficher un menu permettant à l'utilisateur de choisir parmi plusieurs options pour gérer les tâches.
Chaque option du menu correspond à une fonction définie dans le script, qui est ensuite appelée en fonction du choix de l'utilisateur.


Stockage des données :
Les données des tâches sont stockées dans un fichier texte nommé resultat.txt.
Chaque ligne de ce fichier représente une tâche et est structurée comme suit :

id , title , description , location , date_time , status. où chaque élément est séparé par une virgule (,).

Fonctionnement des options :
1) Créer une tâche (create_task):

L'utilisateur fournit les détails de la tâche tels que l'identifiant, le titre, la description, etc.
Ces détails sont ensuite ajoutés à la fin du fichier resultat.txt.

2) Mettre à jour une tâche (update_task):

L'utilisateur fournit l'identifiant de la tâche à mettre à jour.
Si la tâche existe, l'utilisateur peut saisir de nouvelles informations pour la mettre à jour.
La tâche correspondante dans le fichier est mise à jour avec les nouvelles informations.

3) Afficher les informations sur une tâche (show_task_info):

L'utilisateur fournit l'identifiant de la tâche à afficher.
Si la tâche existe, ses détails complets sont affichés.

4) Lister les tâches d'une journée donnée (list_tasks_by_day):

L'utilisateur fournit une date au format "DD-MM-YYYY".
Le script affiche d'abord les tâches complétées et ensuite les tâches non complétées pour cette journée spécifique.

5) Rechercher une tâche par titre (search_task_by_title):

L'utilisateur fournit un titre à rechercher parmi les tâches.
Si une tâche correspondante est trouvée, ses détails sont affichés.

Exécution du programme :

Pour exécuter le programme, vous devez le sauvegarder dans un fichier avec l'extension .sh (par exemple, todo.sh).
Assurez-vous que le fichier a les permissions d'exécution avec la commande chmod +x todo.sh.
Créez un fichier texte nommé resultat.txt dans le même répertoire que le script pour enregistrer les données des tâches.



