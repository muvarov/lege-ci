#!/bin/bash -x

set -e
cd ~
mkdir oe-linaro-ledge
cd oe-linaro-ledge

git config --global user.email "ci@linaro.org"
git config --global user.name "LEGE CI"
adduser --disabled-password --gecos "" build
apt-get install sudo

echo "N" | repo --color=never init -u https://git.linaro.org/people/christophe.priouzeau/oe-lite-manifest.git
repo sync

sudo -H -u build MACHINE=ledge-ti-am572x DISTRO=ledge-gw source ./setup-environment
sudo -H -u build bitbake lmp-gateway-image
