#!/bin/bash

### audio-agent
cd /opt/intelcs/production
cp -a audio_agent/agent.toml audio_agent/agent.toml.originale
## NON serve impostare [internal]network_interface, l'host ha una sola nic
sed -i 's/^host = "localhost"/host = "217.22.213.14"/' audio_agent/agent.toml
sed -i 's/^max_load =.*/max_load = 32/' audio_agent/agent.toml
#### INIZIALIZZARE l'agent:
# audio_agent/install_deps.sh # non ha i permessi di esecuzione
# yum update -y
# yum install boost-system boost-thread log4cxx -y
# audio_agent/install_ffmpeg.sh
#
# audio_agent/install_ffmpeg.sh
# yum install pkg-config make gcc gcc-c++ nasm yasm freetype-devel -y
# # scarica e installa FFMPEG 4.1.3
#
# audio_agent/compile_ffmpeg_with_libfdkaac.sh
# # This script will download and compile a libfdk_aac enabled ffmpeg (4.1.3)
cd audio_agent/
apt-get install wget bzip2 ## dipendenze degli script
./compile_ffmpeg_with_libfdkaac.sh
## /opt/intelcs/production/audio_agent/ffmpeg_libfdkaac_src
/opt/intelcs/production/audio_agent
## /opt/intelcs/production/audio_agent
## Copy libs to /opt/intelcs/production/audio_agent/ffmpeg_libfdkaac_lib
## Compiling finish.
## Downloaded source dir: /opt/intelcs/production/audio_agent/ffmpeg_libfdkaac_src
## Compiled library dir: /opt/intelcs/production/audio_agent/ffmpeg_libfdkaac_lib
cp -a lib lib_ORIGINALE
cp -a ffmpeg_libfdkaac_lib/* lib/
cd /opt/intelcs/production
bin/daemon.sh start audio-agent
#starting audio-agent, stdout -> /opt/intelcs/production/logs/audio-agent.stdout
#2020-10-24 00:50:20.911 - INFO: AmqpClient - Connecting to rabbitMQ server OK, options:
[Object: null prototype] { host: '192.168.25.76', port: 5672 }
#2020-10-24 00:50:20.927 - INFO: WorkingAgent - audio agent join cluster ok.
#2020-10-24 00:50:20.935 - INFO: ClusterWorker - Join cluster owt-cluster OK.
#2020-10-24 00:50:20.939 - INFO: WorkingAgent - as rpc server ok.
#2020-10-24 00:50:20.940 - INFO: WorkingAgent - as monitoring target ok
cat logs/audio-agent.stdout
bin/daemon.sh stop audio-agent