#FROM maidbot/resin-raspberrypi3-qemu
#RUN [ "cross-build-start" ]

#FROM python:3.7-alpine
FROM python:3.6-alpine

#FROM resin/rpi-raspbian:latest

#FROM balenalib/raspberry-pi-alpine-python:latest

#switch on systemd init system in container
ENV INITSYSTEM off

#RUN apt-get update && apt-get install -y \
#        python-pip \
#	&& rm -rf /var/lib/apt/lists/*

#RUN apt-get install -y \
#	python-pip

# pip install python deps from requirements.txt
# For caching until requirements.txt changes
ENV READTHEDOCS True

#COPY ./requirements.txt /requirements.txt
#RUN pip install -r /requirements.txt
#RUN pip install picamera

#RUN [ "cross-build-end" ]  

COPY . /usr/src/app
WORKDIR /usr/src/app


RUN apk add --no-cache --upgrade bash

RUN pip install -r requirements.txt

#COPY /usr/local/lib/python3.6/site-packages/picamera/ /opt/vc/lib/libbcm_host.so

#RUN python -m SimpleHTTPServer

#RUN python -m http.server

EXPOSE 8081

VOLUME ["/data"]

CMD ["bash","start.sh"]
