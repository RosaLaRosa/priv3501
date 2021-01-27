#!/bin/bash

cd /opt/intelcs/production
cp -a video_agent/agent.toml video_agent/agent.toml.originale
sed -i 's/^host = "localhost"/host = "217.22.213.14"/' video_agent/agent.toml
sed -i 's/^max_load =.*/max_load = 64/' video_agent/agent.toml
#### INIZIALIZZARE l'agent:
video_agent/install_deps.sh --software
video_agent/install_ffmpeg.sh
video_agent/install_openh264.sh
#Download libopenh264-1.7.0-linux64.4.so success.
#OpenH264 install finished.
video_agent/init.sh ##non fa nulla, l'accelerazione HW è già disabilitata
bin/daemon.sh start video-agent
#starting video-agent, stdout -> /opt/intelcs/production/logs/video-agent.stdout
#2020-10-24 00:40:32.860 - INFO: AmqpClient - Connecting to rabbitMQ server OK, options:
[Object: null prototype] { host: '192.168.25.76', port: 5672 }
#2020-10-24 00:40:32.879 - INFO: WorkingAgent - video agent join cluster ok.
#2020-10-24 00:40:32.885 - INFO: ClusterWorker - Join cluster owt-cluster OK.
#2020-10-24 00:40:32.889 - INFO: WorkingAgent - as rpc server ok.
#2020-10-24 00:40:32.890 - INFO: WorkingAgent - as monitoring target ok.
cat logs/video-agent.stdout
bin/daemon.sh stop video-agent