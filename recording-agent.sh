#!/bin/bash

### recording-agent
cd /opt/intelcs/production
cp -a recording_agent/agent.toml recording_agent/agent.toml.originale
## NON serve impostare [internal]network_interface, l'host ha una sola nic
sed -i 's/^host = "localhost"/host = "217.22.213.14"/' recording_agent/agent.toml
sed -i 's/^max_load =.*/max_load = 32/' recording_agent/agent.toml
sed -i 's/^path = "\/tmp"/path = "\/mnt\/nfs\/registrazioni\/"/' recording_agent/agent.toml
bin/daemon.sh start recording-agent
#starting recording-agent, stdout -> /opt/intelcs/production/logs/recording-agent.stdout
#2020-10-24 01:11:37.560 - INFO: AmqpClient - Connecting to rabbitMQ server OK, options:
[Object: null prototype] { host: '192.168.25.76', port: 5672 }
#2020-10-24 01:11:37.580 - INFO: WorkingAgent - recording agent join cluster ok.
#2020-10-24 01:11:37.586 - INFO: ClusterWorker - Join cluster owt-cluster OK.
#2020-10-24 01:11:37.590 - INFO: WorkingAgent - as rpc server ok.
#2020-10-24 01:11:37.592 - INFO: WorkingAgent - as monitoring target ok.
cat logs/recording-agent.stdout
bin/daemon.sh stop recording-agent