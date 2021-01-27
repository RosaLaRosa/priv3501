#!/bin/bash

mkdir /opt/custom/cliorepo/intelcs /opt/intelcs/
mv ../KayJu/owt-ubuntu.zip /opt/custom/cliorepo/intelcs/
unzip /opt/custom/cliorepo/intelcs/owt-ubuntu.zip -d /opt/intelcs/
mv /opt/intelcs/dist/ /opt/intelcs/Release-v4.3.1-compilata
ln -s /opt/intelcs/Release-v4.3.1-compilata/ /opt/intelcs/production
chown -R root:root /opt/intelcs/