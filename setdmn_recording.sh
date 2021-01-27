#!/bin/bash

sleep 1; systemctl daemon-reload
sleep 1; systemctl start intelcs-recording-agent.service
sleep 1; systemctl enable intelcs-recording-agent.service