#!/bin/bash

chmod 664 /etc/systemd/system/intelcs-conference-agent.service
sleep 1; systemctl daemon-reload
sleep 1; systemctl start intelcs-conference-agent.service
sleep 1; systemctl enable intelcs-conference-agent.service