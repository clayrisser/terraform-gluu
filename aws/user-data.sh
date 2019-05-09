#!/bin/bash

sudo su

export PUBLIC_IPV4=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)

echo "deb https://repo.gluu.org/ubuntu/ bionic main" > /etc/apt/sources.list.d/gluu-repo.list
curl https://repo.gluu.org/ubuntu/gluu-apt.key | apt-key add -
apt-get update
apt-get upgrade -y
apt-get install -y gluu-server-${gluu_version}
/sbin/gluu-serverd-${gluu_version} enable
/sbin/gluu-serverd-${gluu_version} start
/sbin/gluu-serverd-${gluu_version} login

cat <<EOF > /opt/gluu-server-${gluu_version}/install/community-edition-setup/setup.properties
ip=$PUBLIC_IPV4
hostname=${name}.${domain}
ldap_type=opendj
opendj_type=opendj
orgName=${org_name}
countryCode=${country_code}
city=${city}
state=${state}
jksPass=password
ldapPass=password
inumOrg=
inumAppliance=
EOF

PID=$(machinectl status gluu_server_${gluu_version} 2>/dev/null | grep Leader | awk -F ' ' '{ print $2 };' )
if [[ $PID =~ ^-?[0-9]+$ ]]; then
  ssh -t -o IdentityFile=/etc/gluu/keys/gluu-console -o Port=60022 -o LogLevel=QUIET \
      -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
      -o PubkeyAuthentication=yes root@localhost 'echo | python /install/community-edition-setup/setup.py'
else
  echo "Gluu server is not started."
fi
