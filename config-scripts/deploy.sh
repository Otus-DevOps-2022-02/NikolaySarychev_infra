 #!/bin/bash

echo "---Trying to install Git---"
if sudo apt-get -y install git
then
echo "---Git installed---"
else
echo "---Trying to install git is not success---"
fi

cd ~
echo "---Trying to clone Git repository---"
git clone -b monolith https://github.com/express42/reddit.git

 echo "---Trying to change to the project directory and install an application dependency---"
 cd reddit && bundle install

 echo "---Trying to start application server to project folder---"
 puma -d

echo "---Let's check that the server has started and on which port it is listening---"
ps aux | grep puma
