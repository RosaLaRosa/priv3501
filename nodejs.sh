#!/bin/bash

mkdir -p /opt/custom/cliorepo
cd /opt/custom/cliorepo
curl https://nodejs.org/dist/v10.22.0/node-v10.22.0-linux-x64.tar.gz --output node-v10.22.0-linuxx64.tar.gz
mkdir /opt/nodejs
tar -xzvf node-v10.22.0-linux-x64.tar.gz -C /opt/nodejs/
ln -s /opt/nodejs/node-v10.22.0-linux-x64/ /opt/nodejs/active
ln -s /opt/nodejs/active/bin/node /usr/bin/ 
ln -s /opt/nodejs/active/bin/npm /usr/bin/
