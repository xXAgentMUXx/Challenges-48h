# Utiliser l'image Debian
FROM debian:latest

# Mettre à jour les paquets et installer ntp
RUN apt-get update && \
    apt-get install -y ntp && \
    apt-get clean

# Exposer le port NTP
EXPOSE 123/udp

# Lancer ntpd en mode foreground
CMD ["ntpd", "-g", "-n", "-c", "/etc/ntp.conf"]
