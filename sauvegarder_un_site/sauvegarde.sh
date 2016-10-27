# Config, à personnaliser
# Le nom que vous voulez donner au site
# La sauvegarde sera enregistrée dans 
# un répertoire portant ce nom.
SITE=mon_site
# L'adresse de votre serveur, telle qu'elle vous
# a été donnée par votre hébergeur 
# (c'est l'adresse FTP)
SERVEUR_SITE=ssh.cluster003.ovh.net
# Le nom d'utilisateur pour le FTP
COMPTE_SITE=adnxpzpr
# Le chemin de votre site sur le serveur.
# En général, ce chemin est web ou www
# (si votre site est à la racine de votre
# espace web)
CHEMIN_SITE=www
# Le nom de la base de données
DB_SITE=dbmonsite
# Le nom d'utilisateur de la base de données
DB_USER_SITE=user_dbmonsite
# Le mot de passe de la base de données
DB_MDP_SITE=mOtDePaSsEdB
# Le nom d'hôte du serveur de base de données
# ou son adresse IP
# Ces éléments vous ont été communiqués 
# par l'hébergeur
DB_HOST_SITE=10.0.237.146
# Le répertoire de votre ordinateur 
# dans lequel vous souhaitez stocker
# les sauvegardes.
REP_BACKUP=backup_site

# Ne rien modifier sous cette ligne

# Sauvegarde    
mkdir -p $REP_BACKUP/$SITE
echo $SITE
# Sauvegarde de la BDD
echo Backup BDD
ssh $COMPTE_SITE@$SERVEUR_SITE "mysqldump -u $DB_USER_SITE -p$DB_MDP_SITE -h $DB_HOST_SITE $DB_SITE" > $REP_BACKUP/$SITE/$SITE.sql
# Sauvegarde des fichiers
echo Backup fichiers
scp -r $COMPTE_SITE@$SERVEUR_SITE:$CHEMIN_SITE $REP_BACKUP/$SITE
