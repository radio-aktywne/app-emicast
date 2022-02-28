ARG ALPINE_IMAGE_TAG=3.14.0

FROM alpine:$ALPINE_IMAGE_TAG

RUN apk add --no-cache icecast

COPY ./streamcast/src/icecast.xml /etc/icecast2/icecast.xml

# start script
COPY ./streamcast/src/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
WORKDIR /tmp

# permission for icecast directories
RUN mkdir -p /etc/icecast2 /var/log/icecast2 /usr/share/icecast2
RUN chown -R icecast /etc/icecast2 /var/log/icecast2 /usr/share/icecast2

# default configuration, override that with values from your environment
ENV STREAMCAST_SOURCE_PASSWORD=hackme \
    STREAMCAST_RELAY_PASSWORD=hackme \
    STREAMCAST_ADMIN_PASSWORD=admin \
    STREAMCAST_HOST=localhost

# running on port 8000
EXPOSE 8000

ENTRYPOINT ["./start.sh", "-p", "8000", "-c", "/etc/icecast2/icecast.xml", "-u", "icecast"]
