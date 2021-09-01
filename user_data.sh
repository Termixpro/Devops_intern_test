#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install apt-transport-https
sudo apt install docker.io -y
sudo docker container run --name terminginx -P -d nginx
