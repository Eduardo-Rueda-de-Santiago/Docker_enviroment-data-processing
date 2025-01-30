# Use the official Ubuntu base image
FROM alpine:3.21.2

# Setting up the enviroment
RUN apk update
RUN apk add --no-cache coreutils procps wget curl gnupg tar unzip git bash openjdk8-jdk libc6-compat

# Install Scala
RUN curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > /usr/local/bin/cs && chmod +x /usr/local/bin/cs \
    && /usr/local/bin/cs install scala:2.13.16 && /usr/local/bin/cs install scalac:2.13.16

# Install Apache Spark
RUN wget https://dlcdn.apache.org/spark/spark-3.5.4/spark-3.5.4-bin-hadoop3-scala2.13.tgz && \
    tar -xzf spark-3.5.4-bin-hadoop3-scala2.13.tgz -C /opt/ && \
    rm  spark-3.5.4-bin-hadoop3-scala2.13.tgz && \
    ln -s /opt/spark-3.5.4-bin-hadoop3-scala2.13 /opt/spark

	
# Set up the enviroment
ENV PATH="$PATH:/root/.local/share/coursier/bin:$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin"
ENV SPARK_HOME=/opt/spark

# # Install Apache Hadoop
# RUN wget https://downloads.apache.org/hadoop/common/hadoop-3.3.3/hadoop-3.3.3.tar.gz && \
#     tar -xvzf hadoop-3.3.3.tar.gz -C /opt/ && \
#     rm hadoop-3.3.3.tar.gz && \
#     ln -s /opt/hadoop-3.3.3 /opt/hadoop

# # Install Apache Kafka
# RUN wget https://dlcdn.apache.org/kafka/3.0.0/kafka_2.13-3.0.0.tgz && \
#     tar -xvzf kafka_2.13-3.0.0.tgz -C /opt/ && \
#     rm kafka_2.13-3.0.0.tgz && \
#     ln -s /opt/kafka_2.13-3.0.0 /opt/kafka

# # Install Cassandra
# RUN wget https://downloads.apache.org/cassandra/4.0.0/apache-cassandra-4.0.0-bin.tar.gz && \
#     tar -xvzf apache-cassandra-4.0.0-bin.tar.gz -C /opt/ && \
#     rm apache-cassandra-4.0.0-bin.tar.gz && \
#     ln -s /opt/apache-cassandra-4.0.0 /opt/cassandra

# # Set up environment variables for all installed tools
# ENV SPARK_HOME=/opt/spark
# ENV HADOOP_HOME=/opt/hadoop
# ENV KAFKA_HOME=/opt/kafka
# ENV CASSANDRA_HOME=/opt/cassandra
# ENV PATH=$PATH:$SPARK_HOME/bin:$HADOOP_HOME/bin:$KAFKA_HOME/bin:$CASSANDRA_HOME/bin

# # Expose necessary ports (you can add more depending on the configuration)
# EXPOSE 8080 7077 2181 9092 9042 8081

# Start Cassandra as the default entrypoint
CMD ["bash"]
