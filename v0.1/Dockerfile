# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install essential packages
RUN apt-get update -y && apt-get install -y \
    wget \
    curl \
    gnupg \
    tar \
    unzip \
    git \
    nano \
	default-jre \
	default-jdk \
    && rm -rf /var/lib/apt/lists/*

# Install Scala
RUN curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > /usr/local/bin/cs && chmod +x /usr/local/bin/cs \
    && /usr/local/bin/cs install scala:2.12.20 && /usr/local/bin/cs install scalac:2.12.20


# Make sure the Scala command is available by adding the bin folder to the PATH
ENV PATH="$PATH:/root/.local/share/coursier/bin"

# Install Apache Spark
# RUN wget https://dlcdn.apache.org/spark/spark-3.3.1/spark-3.3.1-bin-hadoop3.2.tgz && \
#     tar -xvzf spark-3.3.1-bin-hadoop3.2.tgz -C /opt/ && \
#     rm spark-3.3.1-bin-hadoop3.2.tgz && \
#     ln -s /opt/spark-3.3.1-bin-hadoop3.2 /opt/spark

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
