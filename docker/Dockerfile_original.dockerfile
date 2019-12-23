FROM openjdk:8-jdk-slim

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Spark env setting
ENV SPARK_VERSION 2.4.4
ENV HADOOP_VERSION 2.7
ENV SPARK_HOME /spark
ENV PYTHON_VERSION 3.7
ENV PIP_VERSION 3

# Configure apt and install packages
RUN apt-get update \
    && apt-get --no-install-recommends -y install wget git sudo vim tzdata \
        python${PYTHON_VERSION} python${PIP_VERSION}-pip \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Python setting
RUN rm -f /usr/bin/python \
    && rm -f /usr/bin/pip \
    && ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python \
    && ln -s /usr/bin/pip${PIP_VERSION} /usr/bin/pip

# download spark
RUN wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=
CMD ["/bin/bash"]
