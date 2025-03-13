FROM debian:latest

RUN apt-get update && \
    apt-get install -y ntp && \
    apt-get clean

RUN echo "server 10.0.0.42" >> /etc/ntp.conf && \
    echo "server 10.0.1.42" >> /etc/ntp.conf

EXPOSE 123/udp

CMD ["ntpd", "-g", "-n", "-c", "/etc/ntp.conf"]
