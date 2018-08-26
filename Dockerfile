# Pull base image
FROM resin/rpi-raspbian:jessie

RUN apt-get update && apt-get install -y wget git pi-bluetooth

RUN wget -q -O - http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | apt-key add -
RUN wget -q -O /etc/apt/sources.list.d/mosquitto-jessie.list http://repo.mosquitto.org/debian/mosquitto-jessie.list
RUN apt-get update && apt-get install -y libmosquitto-dev mosquitto mosquitto-clients

RUN git clone git://github.com/andrewjfreyer/presence /presence
WORKDIR /presence
ENTRYPOINT ["/bin/bash",  "./presence.sh"]
