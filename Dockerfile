FROM ubuntu:latest
ENV NYXTVERSION=2.2.4
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
    gstreamer1.0-gtk3 \
    gstreamer1.0-libav \ 
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-base-apps \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-rtp \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-x \
    # are these needed too?
    # libgstreamer1.0-0 \
    # libgstreamer-plugins-base1.0-0 \
    # libgstreamer-plugins-good1.0-0 \
    # libgstreamer-plugins-bad1.0-0 \
    # libgstreamer-gl1.0-0 \
    alsa-utils \
    libasound2 \ 
    libasound2-data \
    libasound2-plugins \
    libasound2-plugins-extra \
    pulseaudio \
    pulseaudio-utils \
    xauth

RUN wget https://github.com/atlas-engineer/nyxt/releases/download/${NYXTVERSION}/nyxt_${NYXTVERSION}_amd64.deb


RUN dpkg -i ./nyxt_${NYXTVERSION}_amd64.deb

COPY entrypoint.sh /

ENTRYPOINT bash /entrypoint.sh
