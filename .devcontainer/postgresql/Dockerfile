FROM postgres:11.5

RUN localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8
ENV TZ "Asia/Tokyo" \
    LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"
RUN echo $TZ > /etc/timezone
RUN apt-get update \
    && apt-get install -y vim

ARG WORKDIR=/project

ADD ./postgresql.conf /etc/postgresql/postgresql.conf

COPY ./python_dev_env-docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/python_dev_env-docker-entrypoint.sh / \
    && chmod +x /usr/local/bin/python_dev_env-docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/python_dev_env-docker-entrypoint.sh"]
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
