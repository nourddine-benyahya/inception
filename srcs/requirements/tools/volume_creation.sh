#!bin/bash

#create volumes
if [ ! -d "/home/${USER}/data/database_volume" ]; then
    mkdir -p /home/${USER}/data/database_volume;
fi

if [ ! -d "/home/${USER}/data/wordpress_volume" ]; then
    mkdir -p /home/${USER}/data/wordpress_volume;
fi

#configure DNS
if ! grep -q "${USER}.42.fr" /etc/hosts; then
    sudo sed -i "s/^127.0.0.1\s\+localhost.*/& ${USER}.42.fr/" /etc/hosts
fi