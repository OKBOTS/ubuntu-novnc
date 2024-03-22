#!/bin/bash

# Start the noVNC server with the specified port
nohup /usr/bin/websockify --web /usr/share/novnc --ws-forward-origin localhost:8080 localhost:5901 localhost:$1 >/dev/null 2>&1 &

# Wait for the noVNC server to start
sleep 2
