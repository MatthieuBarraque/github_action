# github_action
first try github action
Chocolatine

######

• L'ensemble de vos fichiers sources, à l'exception de tous les fichiers inutiles (binaires, fichiers temporaires, fichiers obj, etc.), doit être inclus dans votre livraison.
Quelles que soient vos opinions, ceci est une chocolatine.
Mais à quoi cela sert-il ? Elle vous permet de passer la journée et votre travail plus facilement. En d'autres termes, elle facilite votre travail et vous permet de vous concentrer sur les choses qui comptent (discuter de son nom ne relève pas de cette catégorie).
Vos dépôts sont hébergés sur GitHub, et GitHub dispose d'un moyen intuitif d'automatiser le lancement d'actions prédéfinies, déclenchées par des événements de votre choix. C'est, de la même manière que les chocolatines, un excellent moyen de faciliter et d'améliorer votre développement et votre flux de travail.
Dans ce projet, vous allez mettre en place un flux de travail GitHub Actions pour appliquer de bonnes pratiques et diverses règles dans un dépôt.
Les actions GitHub sont gratuites et illimitées pour les dépôts publics, et gratuites jusqu'à 2 000 minutes par mois pour les dépôts privés personnels, ce qui est assez généreux !
1
DÉTAILS TECHNIQUES
Vous devrez remettre un seul fichier de flux de travail YAML nommé chocolatine.yml, placé soit :
• à la racine de votre dépôt ;
• soit dans le dossier .github/workflows.
Votre flux de travail doit être utilisable avec vos différents projets Epitech et leurs technologies et outils respectifs.
Pour ce projet, seules les actions externes actions/checkout et pixta-dev/repository-mirroring-action sont autorisées.
Toutes les autres actions externes (que vous pouvez trouver sur le marché GitHub, par exemple) sont strictement interdites.
Si des paramètres ou des éléments particuliers ne sont pas spécifiés ou traités dans le sujet, vous êtes libre de les traiter comme bon vous semble.
ÉVALUATION
Votre flux de travail sera testé en copiant votre fichier chocolatine.yml, et seulement ce fichier, dans le répertoire .github/workflows d'un dépôt de test.
Assurez-vous ensuite que le flux de travail est autonome et qu'il ne nécessite aucun fichier externe.
SECRETS
Vous pourriez avoir besoin d'utiliser des données ou des valeurs sécurisées pour faire fonctionner votre flux de travail avec succès.
Dans ce cas, vous devez utiliser des secrets.
Si une valeur sensible codée en dur est trouvée dans votre fichier de flux de travail, l'ensemble de votre projet échouera. Vous avez été prévenu.
2
FONCTIONNALITÉS
En utilisant un flux de travail GitHub Actions, vous devrez mettre en place un ensemble de fonctionnalités.
Le flux de travail doit être exécuté à chaque push et à chaque création de pull request, sauf si le nom de la branche commence par ga-ignore-, auquel cas le flux de travail ne doit pas être exécuté du tout.
En outre, chaque tâche doit :
• commencer par vérifier le dépôt de la branche correspondante ;
• être exécutée uniquement si la tâche précédente a réussi.
L'ordre dans lequel les tâches doivent être exécutées est l'ordre dans lequel elles sont définies ci-dessous dans le sujet.
VARIABLES D'ENVIRONNEMENT
Vous devez définir plusieurs variables d'environnement, disponibles au niveau du flux de travail.
• MIRROR_URL : l'URL du dépôt Epitech qui servira de miroir ;
• EXECUTABLES : une liste séparée par des virgules des chemins des exécutables qui doivent être produits (elle peut avoir un seul exécutable, comme "pushswap" ou "lib/my/libmy.a", ou plusieurs, comme "antman/antman,giantman/giantman").
Les valeurs de toutes les variables d'environnement doivent être des chaînes de caractères.
"disponible au niveau du flux de travail" signifie que les variables d'environnement ne doivent être définies qu'une seule fois et être disponibles pour toutes les tâches et étapes du flux de travail.
3
TÂCHES
VÉRIFICATION DU STYLE DE CODAGE
Créez une tâche avec l'ID check_coding_style qui s'exécute dans un conteneur Docker ghcr.io/epitech/coding-style-checker:latest, et qui :
• exécute le script de vérification du style de codage avec la commande suivante :
∇ Terminal - + x
check.sh $(pwd) $(pwd)
• affiche chaque erreur de style de codage sous forme d'annotation d'erreur, s'il y en a ;
• fait échouer la tâche s'il y a des erreurs de style de codage.
La sortie de la tâche doit ressembler à ceci :
En utilisant les paramètres d'annotation d'erreur appropriés, vous pourrez cliquer dessus et être dirigé vers la ligne précise du fichier incriminé.
4
VÉRIFICATION DE LA COMPILATION DU PROGRAMME
Créez une tâche avec l'ID check_program_compilation qui, dans l'ordre :
• lance make à la racine du dépôt (cette étape doit avoir une limite de temps de 2 minutes) ;
• lance (sur une étape distincte) make clean à la racine du dépôt ;
• vérifie que chaque fichier spécifié dans la variable d'environnement EXECUTABLES existe et est exécutable (la tâche doit échouer si l'un des exécutables n'est pas là ou n'est pas exécutable).
Cette tâche doit être exécutée dans un conteneur Docker epitechcontent/epitest-docker.
EXÉCUTION DES TESTS (PARCE QUE C'EST CE QUE FONT LES HÉROS)
Créez une tâche avec l'ID run_tests qui lance make tests_run à la racine du dépôt (cette étape doit avoir une limite de temps de 2 minutes).
Cette tâche doit être exécutée dans un conteneur Docker epitechcontent/epitest-docker.
PUSH VERS LE DÉPÔT MIROIR
Créez une tâche avec l'ID push_to_mirror qui exécute un miroir vers le dépôt spécifié dans la variable d'environnement MIRROR_URL.
Elle doit utiliser un secret nommé GIT_SSH_PRIVATE_KEY pour spécifier la clé privée SSH à utiliser.
Cette tâche ne doit être exécutée que lorsqu'un push est effectué vers le dépôt.

######% 
