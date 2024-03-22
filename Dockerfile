# Dockerfile

# Start from an official Ubuntu image
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update \
 && apt-get install -y \
    noVNC \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    && rm -rf /var/lib/apt/lists/*

# Remove unnecessary desktop environment files
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a custom user and group to avoid running as root
RUN groupadd -r user -g 1001 \
 && useradd -r -m -s /bin/bash -u 1001 user -g user

# Change to the new user
USER user

# Add necessary configuration to run the VNC server
RUN echo "
export VNCSERVEROPTS='-geometry 1024x768 -autokill -nolocalfeedback -noquestioninput -SecurityTypes None -rfbauth /home/user/.vnc/passwd'
" >> /home/user/.bashrc

# Add a custom port for the VNC server
EXPOSE 5901

# Start the VNC server when the container starts
CMD ["tightvncserver", "-localhost", "-geometry", "1024x768", "-rfbport", "5901", "-SecurityTypes", "None", "-AlwaysShared", "-AcceptKeyEvents", "-AcceptPointerEvents", "-AcceptSetDesktopSize", "-SendCutText", "-AcceptCutText", ":1"]

# Copy the noVNC configuration file to the container
COPY novnc.conf /etc/noVNC/

# Run the noVNC server with the necessary flags
CMD ["/usr/bin/websockify", "--web=/usr/share/novnc/", "localhost:5901", "localhost:6901"]

# Change the port of the noVNC server to 8080
CMD ["./start-novnc.sh", "8080"]
