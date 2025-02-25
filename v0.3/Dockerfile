# Use the official Ubuntu base image
FROM alpine:3.21.2

# Setting up the enviroment
RUN apk update
RUN apk add --no-cache coreutils procps wget curl tar bash openjdk8-jdk libc6-compat

# Install Scala
RUN mkdir /opt/scala && \
	curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > /opt/scala/cs && \
	chmod +x /opt/scala/cs && \
	/opt/scala/cs install scala:2.13.16 --install-dir /opt/scala && \
	/opt/scala/cs install scalac:2.13.16 --install-dir /opt/scala

# Install Apache Spark
RUN wget https://dlcdn.apache.org/spark/spark-3.5.4/spark-3.5.4-bin-hadoop3-scala2.13.tgz && \
    tar -xzf spark-3.5.4-bin-hadoop3-scala2.13.tgz -C /opt/ && \
    rm spark-3.5.4-bin-hadoop3-scala2.13.tgz && \
    mv /opt/spark-3.5.4-bin-hadoop3-scala2.13 /opt/spark

# Install Apache Hadoop
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz && \
	tar -xvzf hadoop-3.4.1.tar.gz -C /opt/ && \
	rm hadoop-3.4.1.tar.gz && \
	mv /opt/hadoop-3.4.1 /opt/hadoop
	
# Install Apache Kafka
RUN wget https://dlcdn.apache.org/kafka/3.9.0/kafka_2.13-3.9.0.tgz && \
	tar -xvzf kafka_2.13-3.9.0.tgz -C /opt/ && \
	rm kafka_2.13-3.9.0.tgz && \
	mv /opt/kafka_2.13-3.9.0 /opt/kafka

# Install Cassandra
RUN wget https://downloads.apache.org/cassandra/4.0.0/apache-cassandra-4.0.0-bin.tar.gz && \
    tar -xvzf apache-cassandra-4.0.0-bin.tar.gz -C /opt/ && \
    rm apache-cassandra-4.0.0-bin.tar.gz && \
    mv /opt/apache-cassandra-4.0.0 /opt/cassandra

# Set up the enviroment
ENV JAVA_HOME=/usr
ENV SCALA_HOME=/opt/scala
ENV SPARK_HOME=/opt/spark
ENV HADOOP_HOME=/opt/hadoop
ENV KAFKA_HOME=/opt/kafka
ENV CASSANDRA_HOME=/opt/cassandra

ENV PATH="$PATH:$JAVA_HOME/bin:$SCALA_HOME:$SPARK_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$KAFKA_HOME/bin:$CASSANDRA_HOME/bin"

# Expose necessary ports (you can add more depending on the configuration)
EXPOSE 9870

# Start Cassandra as the default entrypoint
CMD ["bash"]
