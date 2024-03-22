FROM dorowu/ubuntu-desktop-lxde-vnc

# Run the container with the ports for HTTP (80) and VNC (5900) forwarded
# to the host at the specified ports (8080 and 5900)
EXPOSE 80 5900

CMD ["-v", "/dev/shm:/dev/shm", "-p", "8080:80", "-p", "5900:5900", "-e", "VNC_PASSWORD=", "-e", "HTTP_PASSWORD=", "-e", "SSL_PORT=", "-e", "RELATIVE_URL_ROOT=", "dorowu/ubuntu-desktop-lxde-vnc"]
