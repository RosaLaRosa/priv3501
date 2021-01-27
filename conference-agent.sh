#!/bin/bash

### conference-agent
cd /opt/intelcs/production
cp -a conference_agent/agent.toml conference_agent/agent.toml.originale
## NON serve impostare [internal]network_interface, l'host ha una sola nic
sed -i 's/^host = "localhost"/host = "217.22.213.14"/' conference_agent/agent.toml
sed -i 's/^max_load =.*/max_load = 32/' conference_agent/agent.toml
sed -i 's/^dataBaseURL = "localhost\/owtdb"/dataBaseURL = "217.22.213.14\/owtdb"/'
conference_agent/agent.toml
bin/daemon.sh start conference-agent
#starting conference-agent, stdout -> /opt/intelcs/production/logs/conference-agent.stdout
#2020-10-24 00:51:53.980 - INFO: AmqpClient - Connecting to rabbitMQ server OK, options:
[Object: null prototype] { host: '192.168.25.76', port: 5672 }
#2020-10-24 00:51:54.007 - INFO: WorkingAgent - conference agent join cluster ok.
#2020-10-24 00:51:54.014 - INFO: ClusterWorker - Join cluster owt-cluster OK.
#2020-10-24 00:51:54.019 - INFO: WorkingAgent - as rpc server ok.
#2020-10-24 00:51:54.020 - INFO: WorkingAgent - as monitoring target ok.
cat logs/conference-agent.stdout
bin/daemon.sh stop conference-agent