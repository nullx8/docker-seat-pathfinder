# docker-seat-pathfinder
A custom Docker-Compose for deploying EVE SeAT + Pathfinder.

## Attributions

Basis for the Pathfinder Dockerfile: [https://github.com/KryptedGaming]KryptedGaming / [https://github.com/KryptedGaming/pathfinder-docker]pathfinder-docker
Pathfinder portion of `nginx.conf`: [https://github.com/exodus4d]exodus4d / [https://gist.github.com/exodus4d/791f2742e6b2ee5ef481]pathfinder.conf
Much of `docker-compose.yaml`: [https://github.com/eveseat]eveseat / [https://github.com/eveseat/seat-docker]seat-docker

## Building the image
```
docker build --build-arg VERSION=master -t pathfinder:dev -f ./pathfinder/Dockerfile
```
