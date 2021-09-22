FROM ubuntu:latest
WORKDIR /opt/nyxt
RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/atlas-engineer/nyxt/releases/download/2.2.0/nyxt_2.2.0_amd64.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
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
    libfixposix3

RUN apt-get install -y xauth

RUN dpkg -i ./nyxt_2.2.0_amd64.deb
#CMD nyxt

COPY entrypoint.sh /

ENTRYPOINT bash /entrypoint.sh
