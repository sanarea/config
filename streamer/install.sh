#!/bin/bash
sudo cp streamer.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable streamer.service
sudo systemctl start streamer.service