#!/bin/bash

#server=51.250.10.19

#echo "---Trying connect to $serveer---"
#ssh yc-user@$server
#echo "---Connected---"

echo "---Apt update---"
sudo apt update

echo "---Trying to install Ruby and bundler---"
if sudo apt install -y ruby-full ruby-bundler build-essential
then 
echo "---Ruby and bundler istalled---"
else
echo "---Trying to install Ruby and bundler has not success---"
fi

ruby -v
bundler -v

