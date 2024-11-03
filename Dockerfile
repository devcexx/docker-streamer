FROM debian:bookworm

RUN apt-get update && apt-get -y install firefox-esr chromium novnc pulseaudio pavucontrol supervisor xvfb x11vnc fluxbox ffmpeg xterm

COPY ./supervisor.conf /supervisor.conf
RUN useradd -ms /bin/bash streamer
ENTRYPOINT supervisord -c /supervisor.conf
