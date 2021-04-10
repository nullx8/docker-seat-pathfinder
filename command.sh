#!/bin/bash

set -e

if ! [[ "$1" =~ ^(backup|disable-setup|import-universe)$ ]]; then
    echo "Usage: $0 [command]"
    echo " Available commands: backup, disable-setup, import-universe"
    exit 1
fi

backup() {
    BACKUP_SUFFIX=$(date +"_backup_%m-%d-%Y_%H-%M-%S.sql.gz")

    docker-compose exec mariadb sh -c 'exec mysqldump seat -u"$MYSQL_USER" -p"$MYSQL_PASSWORD"' | gzip > "seat$BACKUP_SUFFIX"
    docker-compose exec mariadb sh -c 'exec mysqldump pathfinder -u"$MYSQL_USER" -p"$MYSQL_PASSWORD"' | gzip > "pathfinder$BACKUP_SUFFIX"
}

disable-setup-path() {
    docker-compose exec pathfinder-php sh -c 'sed -i "s/GET @setup/;GET @setup/g" /var/www/pathfinder/app/routes.ini'
}

import-universe() {
    wget https://github.com/exodus4d/pathfinder/raw/master/export/sql/eve_universe.sql.zip
    unzip eve_universe.sql.zip
    docker cp eve_universe.sql "$(sudo docker-compose ps | grep db | awk '{ print $1}'):/eve_universe.sql"
    docker-compose exec mariadb sh -c 'exec mysql -u$MYSQL_USER -p"$MYSQL_PASSWORD" eve_universe < /eve_universe.sql'
    docker-compose exec mariadb sh -c 'rm -f /eve_universe.sql'
    rm -f eve_universe.sql*
}

case $1 in
    backup)
        echo "Starting backup"
        backup
        ;;
    disable-setup)
        echo "Disabling /setup path"
        disable-setup-path
        ;;
    import-universe)
        echo "Importing EVE Universe dump"
        import-universe
        ;;
esac