FROM dorowu/ubuntu-desktop-lxde-vnc

# Set the desired VNC password
ENV VNC_PASSWORD=my_password

# Set the HTTP base authentication password
#ENV HTTP_PASSWORD=my_http_password

# Set the SSL port (443)
ENV SSL_PORT=443

# Set the desired screen resolution
ENV RESOLUTION=1920x1080

# Set the default user and password
#ENV USER=my_user PASSWORD=my_user_password

# Set the relative URL root (if deploying to a subdirectory)
#ENV RELATIVE_URL_ROOT=/

# Run the container with the ports for HTTP (80), VNC (5900), and HTTPS (443) forwarded
# to the host at the specified ports (8080, 5900, and 8443)
EXPOSE 80 5900 443

CMD ["-v", "/dev/shm:/dev/shm", "-p", "8080:80", "-p", "5900:5900", "-e", "VNC_PASSWORD=$VNC_PASSWORD", "-e", "HTTP_PASSWORD=$HTTP_PASSWORD", "-e", "SSL_PORT=$SSL_PORT", "-e", "RESOLUTION=$RESOLUTION", "-e", "USER=$USER", "-e", "PASSWORD=$PASSWORD", "-e", "RELATIVE_URL_ROOT=$RELATIVE_URL_ROOT", "dorowu/ubuntu-desktop-lxde-vnc"]
