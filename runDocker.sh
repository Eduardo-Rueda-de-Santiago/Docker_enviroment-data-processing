#!/bin/bash

# Build the Docker image
docker build -t eduardoruedadesantiago/enviroment-data-processing ./v0.2

# Run the container with the specified volume
docker run --volume "C:/Users/eduar/OneDrive - U-tad/UTAD/Tercer año/Segundo cuatrimestre/Procesamiento de Datos/Scala:/Shared" eduardoruedadesantiago/enviroment-data-processing:latest tail -f /dev/null

# Get the container ID (or name it explicitly in 'docker run' above)
CONTAINER_ID=$(docker ps -q -f ancestor=enviroment-data-processing)

# Enter the running container
docker exec -it "$CONTAINER_ID" sh
