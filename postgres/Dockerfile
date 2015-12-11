# postgres in a container
#
# docker run -rm -i -d \
#       -p 5432 \
#       -e USERNAME=docker  \
#       -e PASSWORD=docker  \
#       -v `pwd`/postgres:/var/lib/postgresql:rw \
#       -v /etc/localtime:/etc/localtime \
#       jacksoncage/postgres

FROM        debian:jessie
MAINTAINER  Love Nyberg "love.nyberg@lovemusic.se"
ENV         REFRESHED_AT 2015-12-11

# Update the package repository
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -yqq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yqq wget curl psmisc

# Install Dockyard
RUN curl -sS https://raw.github.com/dynport/dockyard/master/dockyard \
    -o /usr/local/bin/dockyard && \
    chmod 0755 /usr/local/bin/dockyard
    dockyard install postgresql 9.2.4 && \
    useradd postgres

# Clean image
RUN apt-get -yqq clean && \
    apt-get -yqq purge && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/*

COPY pg_hba.conf     /etc/postgresql/9.2/main/
COPY pg_ident.conf   /etc/postgresql/9.2/main/
COPY postgresql.conf /etc/postgresql/9.2/main/

EXPOSE 5432
COPY start.sh /start.sh
CMD ["bash", "start.sh"]
