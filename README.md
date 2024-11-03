# Docker Streamer

Simple Docker image that orchestrates a X environment with a VNC server and noVNC, and a Firefox, Chrome, Pulse audio and FFmpeg installations, for streaming the audio output of the Pulse Audio server to FFmpeg, and from there to any other location (RTMP server, whatever).

Building the image:

```bash
docker build -t devcexx/streamer .
```

Running the image:

```bash
docker run --name streamer \
   -p 6080:6080 \
   -e RTMP_URL="rtmp://myrtmpserver/live/livestream" \
   --shm-size=2G -it --rm devcexx/streamer supervisord -c /supervisor.conf
```

You may use a web browser to connect through VNC to the instance at `http://localhost:6080`.

Take your own look to `supervisor.conf` for modifying anything to your needs (which programs gets opened, what ffmpeg command to use, etc).
