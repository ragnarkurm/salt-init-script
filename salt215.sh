#!/bin/sh

domain='215.vkhk.ee'
master='salt-linux.vkhk.ee'

apt-get -y install python-software-properties && \
add-apt-repository -y ppa:saltstack/salt && \
apt-get update && \
apt-get -y install salt-minion && \
true

echo "master: $master" >> /etc/salt/minion

host=`hostname`
mac=`ip link show eth0 | awk '/ether/ {print $2}'`
id="$host.$domain.$mac"
echo "$id" > /etc/salt/minion_id

service salt-minion restart
