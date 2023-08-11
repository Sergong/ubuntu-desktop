#!/bin/bash

# Install python3-pip
sudo apt install python3-pip
pip3 install ansible ansible-lint

echo "Log out and log back in to enable ansible to be found in path..."
