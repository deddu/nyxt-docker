FROM ubuntu:latest
ENV NYXTVERSION=2.2.1
WORKDIR /opt/nyxt
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    wget \
    libfixposix-dev \
    libwebkit2gtk-4.0-dev \
    glib-networking \
    gsettings-desktop-schemas \
    xclip \
    enchant \
    libwebkit2gtk-4.0-37 \
    libgtk-3-0 \
    libpangocairo-1.0-0 \
    libcairo2 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgirepository-1.0-1 \
    libfixposix3 \ 
    xauth

RUN wget https://github.com/atlas-engineer/nyxt/releases/download/${NYXTVERSION}/nyxt_${NYXTVERSION}_amd64.deb


RUN dpkg -i ./nyxt_${NYXTVERSION}_amd64.deb

COPY entrypoint.sh /

ENTRYPOINT bash /entrypoint.sh
