FROM debian:jessie-slim

RUN apt-get update -qq && \
  LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y slapd

COPY slapd.sh slapd.sh

# To store the data outside the container, mount /var/lib/ldap as a data volume

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 389
EXPOSE 636

ENTRYPOINT bash slapd.sh
