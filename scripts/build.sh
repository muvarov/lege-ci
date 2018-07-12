#!/bin/bash -x

set -e
cd /opt
chmod 777 /opt

mkdir oe-linaro-ledge
cd oe-linaro-ledge

git config --global user.email "ci@linaro.org"
git config --global user.name "LEGE CI"
adduser --disabled-password --gecos "" build
apt-get install -y --force-yes sudo python3

echo "N" | repo --color=never init -u https://git.linaro.org/people/christophe.priouzeau/oe-lite-manifest.git
repo sync

chown -R build:build /opt

sudo -s -H -u build MACHINE=ledge-ti-am572x DISTRO=ledge-gw source ./setup-environment
find . -name auto.conf
echo "OSF_LMP_GIT_URL=\"github.com\"" >> build-ledge-gw/conf/auto.conf
echo "OSF_LMP_GIT_NAMESPACE=\"OpenSourceFoundries/\"" >> build-ledge-gw/conf/auto.conf

sudo -s -H -u build bash -c 'MACHINE=ledge-ti-am572x DISTRO=ledge-gw source ./setup-environment && bitbake lmp-gateway-image'
