#!/bin/bash

sleep 40

apt-get install apt-transport-https ca-certificates

echo "---Trying to add keys and repos MongoDB---"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
echo "---Trying to update the index of available packages---"
apt-get update

echo "---Trying to install install MongoDB---"
if apt-get install -y mongodb-org
then
echo "---MongoDB installed---"
else
echo "---Trying to install MongoDB is not success---"
fi

echo "---Trying to start MongoDB---"
systemctl start mongod


echo "---Trying to add MongoDB to autorun---"
systemctl enable mongod

echo "---Сheck status MongoDB service---"
systemctl status mongod
