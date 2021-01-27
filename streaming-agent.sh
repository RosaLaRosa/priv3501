#!/bin/bash

### streaming-agent
cd /opt/intelcs/production
cp -a streaming_agent/agent.toml streaming_agent/agent.toml.originale
## NON serve impostare [internal]network_interface, l'host ha una sola nic
sed -i 's/^host = "localhost"/host = "217.22.213.14"/' streaming_agent/agent.toml
sed -i 's/^max_load =.*/max_load = 32/' streaming_agent/agent.toml
bin/daemon.sh start streaming-agent
#starting streaming-agent, stdout -> /opt/intelcs/production/logs/streaming-agent.stdout
#2020-10-24 01:14:24.869 - INFO: AmqpClient - Connecting to rabbitMQ server OK, options:
[Object: null prototype] { host: '192.168.25.76', port: 5672 }
#2020-10-24 01:14:24.897 - INFO: WorkingAgent - streaming agent join cluster ok.
#2020-10-24 01:14:24.904 - INFO: ClusterWorker - Join cluster owt-cluster OK.
#2020-10-24 01:14:24.909 - INFO: WorkingAgent - as rpc server ok.
#2020-10-24 01:14:24.910 - INFO: WorkingAgent - as monitoring target ok.
cat logs/streaming-agent.stdout
bin/daemon.sh stop streaming-agent