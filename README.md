# docker-seat-pathfinder
A custom Docker-Compose for deploying EVE SeAT + Pathfinder.

## Attributions

- Basis for the Pathfinder Dockerfile: [KryptedGaming](https://github.com/KryptedGaming) / [pathfinder-docker](https://github.com/KryptedGaming/pathfinder-docker)
- Pathfinder portion of `nginx.conf`: [exodus4d](https://github.com/exodus4d) / [pathfinder.conf](https://gist.github.com/exodus4d/791f2742e6b2ee5ef481)
- Much of `docker-compose.yaml` and `command.sh`: [eveseat](https://github.com/eveseat) / [seat-docker](https://github.com/eveseat/seat-docker)
- h5bp Nginx configs: [h5bp](https://github.com/h5bp) / [server-configs-nginx](https://github.com/h5bp/server-configs-nginx)

## Building the images
```
docker-compose build
```

## Setup
Prior to starting this step, you should already have your certificates ready. You also need to copy `.env.example` to `.env` and fill that out. Additionally `config.ini`, `environment.ini`, and `pathfinder.ini` must be coppied from `config/templates` to `config` and filled out as well.
```bash
docker-compose up -d

# Go to https://pathfinder.YOUR_DOMAIN/setup and perform all setup, then return to this point.
./command.sh disable-setup
./command.sh import-universe
```

## Backing up the database
```bash
# This command will create two timestamped .gz files containing SQL dumps into the working directory
./command.sh backup
```

## Restoring the database
```bash
zcat seat_backup.sql.gz | docker-compose exec -T mariadb sh -c 'exec mysql "seat" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD"'
zcat pathfinder_backup.sql.gz | docker-compose exec -T mariadb sh -c 'exec mysql "pathfinder" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD"'
```