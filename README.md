# docker-seat-pathfinder
A custom Docker-Compose for deploying EVE SeAT + Pathfinder.

## Building the image
```
docker build --build-arg VERSION=master -t pathfinder:dev -f ./pathfinder/Dockerfile
```
