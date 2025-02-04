Aplicaciones instaladas:

- Scala: versión 2.12.20
- Spark: versión 3.5.4
- Hadoop: todavía no
- Kafka: todavía no
- Casandra: todavía no

Instructions to run the container indefinitely:´

`docker run --volume <Local path>:<Container path> eduardoruedadesantiago/enviroment-data-processing tail -f /dev/null`

Instructions to connect by terminal to the docker and run scala:

`docker exec -it <Container name, not image!> sh`