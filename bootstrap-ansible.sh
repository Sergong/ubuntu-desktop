#!/bin/bash

sudo apt update && sudo apt upgrade -y

# Install python3-pip
sudo apt install python3-full python3-pip -y

# Install ansible in virtual python env
python3 -m venv ~/ansible
~/ansible/bin/pip3 install ansible

profile_append=$(cat << EOF
# set PATH so it includes user's virtual ansible environment if it exists
if [ -d "\$HOME/ansible/bin" ] ; then
    PATH="\$HOME/ansible/bin:\$PATH"
fi
EOF
)

result=$(grep -e '-d "\$HOME//bin"' ~/.profile)

if [ -z "$result" ]; then
    echo "Adding Ansible VENV path to .profile file"
    cat $profile_append >> ~/.profile
else
    echo "The .profile file already contains the path to the Ansible venv."
fi

echo "Log out and log back in to enable ansible to be found in path..."
