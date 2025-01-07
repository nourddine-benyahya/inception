#!bin/bash

if [ ! -d "/home/${USER}/data/database_volume" ]; then
    mkdir -p /home/${USER}/data/database_volume;
fi

if [ ! -d "/home/${USER}/data/wordpress_volume" ]; then
    mkdir -p /home/${USER}/data/wordpress_volume;
fi

#configure DNS
sudo sed -i "s/^127.0.0.1       localhost.*/127.0.0.1       localhost nbenyahy.42.fr/" /etc/hosts