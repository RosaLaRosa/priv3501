#!/bin/bash

chmod 664 /etc/systemd/system/intelcs-video-agent.service
sleep 1; systemctl daemon-reload
sleep 1; systemctl start intelcs-video-agent.service
sleep 1; systemctl enable intelcs-video-agent.service
