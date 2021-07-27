FROM alpine:3.14.0

RUN apk add --no-cache icecast

COPY ./src/icecast.xml /etc/icecast2/icecast.xml

# start script
COPY ./src/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
WORKDIR /tmp

# permission for icecast directories
RUN mkdir -p /etc/icecast2 /var/log/icecast2 /usr/share/icecast2
RUN chown -R icecast /etc/icecast2 /var/log/icecast2 /usr/share/icecast2

EXPOSE 8080

ENTRYPOINT ["./start.sh", "-p", "8080", "-c", "/etc/icecast2/icecast.xml", "-u", "icecast"]
