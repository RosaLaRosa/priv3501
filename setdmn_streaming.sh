#!/bin/bash

chmod 664 /etc/systemd/system/intelcs-streaming-agent.service
sleep 1; systemctl daemon-reload
sleep 1; systemctl start intelcs-streaming-agent.service
sleep 1; systemctl enable intelcs-streaming-agent.service