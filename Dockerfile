FROM alpine:3.14.0

RUN apk add --no-cache icecast

COPY ./decay/src/icecast.xml /etc/icecast2/icecast.xml

# start script
COPY ./decay/src/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
WORKDIR /tmp

# permission for icecast directories
RUN mkdir -p /etc/icecast2 /var/log/icecast2 /usr/share/icecast2
RUN chown -R icecast /etc/icecast2 /var/log/icecast2 /usr/share/icecast2

# default configuration, override that with values from your environment
ENV DECAY_SOURCE_PASSWORD=hackme \
    DECAY_RELAY_PASSWORD=hackme \
    DECAY_ADMIN_PASSWORD=admin \
    DECAY_PASSWORD=hackme \
    DECAY_HOST=localhost

# running on port 8000
EXPOSE 8000

ENTRYPOINT ["./start.sh", "-p", "8000", "-c", "/etc/icecast2/icecast.xml", "-u", "icecast"]
