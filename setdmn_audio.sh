#!/bin/bash

chmod 664 /etc/systemd/system/intelcs-audio-agent.service
sleep 1; systemctl daemon-reload
sleep 1; systemctl start intelcs-audio-agent.service
sleep 1; systemctl enable intelcs-audio-agent.service