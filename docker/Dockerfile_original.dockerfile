ARG PYTHON_VERSION=3.8.6
FROM python:${PYTHON_VERSION}

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
RUN echo $TZ > /etc/timezone

ARG WORKDIR=/project
WORKDIR ${WORKDIR}

# change default shell
SHELL ["/bin/bash", "-c"]
RUN chsh -s /bin/bash

# Increase timeout for apt-get to 300 seconds
RUN /bin/echo -e "\n\
    Acquire::http::Timeout \"300\";\n\
    Acquire::ftp::Timeout \"300\";" >> /etc/apt/apt.conf.d/99timeout

# Configure apt and install packages
RUN rm -rf /var/lib/apt/lists/* \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get -y install sudo vim tzdata less \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# pyright install
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && npm install --global pyright

RUN pip install -U pip

# copy requirements files
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements-dev.txt /tmp/requirements-dev.txt

# library install
RUN pip install -r /tmp/requirements.txt -r /tmp/requirements-dev.txt

ENV DEBIAN_FRONTEND=
CMD ["/bin/bash"]
