#!/bin/bash

sudo apt-get install apt-transport-https ca-certificates

echo "---Trying to add keys and repos MongoDB---"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
echo "---Trying to update the index of available packages---"
sudo apt-get update

echo "---Trying to install install MongoDB---"
if sudo apt-get install -y mongodb-org
then
echo "---MongoDB installed---"
else
echo "---Trying to install MongoDB is not success---"
fi

echo "---Trying to start MongoDB---"
sudo systemctl start mongod


echo "---Trying to add MongoDB to autorun---"
sudo systemctl enable mongod

echo "---Сheck status MongoDB service---"
sudo systemctl status mongod
