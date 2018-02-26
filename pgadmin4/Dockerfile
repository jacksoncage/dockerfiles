FROM alpine:latest
MAINTAINER Anton Rymkus <rymkus@gmail.com>

ENV PGADMIN_VERSION=1.0 \
    PGADMIN_SUFFIX=ReleaseCandidate1 \
    PGADMIN_SUFFIX_MINI=rc1

RUN apk add --update \
        wget bash postgresql-dev \
        python python-dev py-pip py-crypto
RUN apk add py-psycopg2 --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/main/ --allow-untrusted

ADD config_local.py /usr/lib/python2.7/site-packages/pgadmin4/config_local.py
ADD LICENSE /usr/lib/python2.7/site-packages/pgadmin4/LICENSE

# Download
RUN wget -nv --no-check-certificate --tries=5 https://ftp.postgresql.org/pub/pgadmin3/pgadmin4/v1.0-rc1/pip/pgadmin4-1.0rc1-py2-none-any.whl -O /pgadmin4-1.0rc1-py2-none-any.whl
#ADD pgadmin4-1.0rc1-py2-none-any.whl /pgadmin4-1.0rc1-py2-none-any.whl

RUN pip install /pgadmin4-1.0rc1-py2-none-any.whl

RUN apk del wget bash \
  && rm -rf /var/cache/apk/* ;\
  rm -rfv /pgadmin4-1.0rc1-py2-none-any.whl
# bash
  
EXPOSE 8080


CMD [ "python", "/usr/lib/python2.7/site-packages/pgadmin4/pgAdmin4.py" ]

