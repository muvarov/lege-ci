#!/bin/bash -x

set -e
cd ~
mkdir oe-linaro-ledge
cd oe-linaro-ledge

git config --global user.email "ci@linaro.org"
git config --global user.name "LEGE CI"

echo "N" | repo --color=never init -u https://git.linaro.org/people/christophe.priouzeau/oe-lite-manifest.git
repo sync

MACHINE=ledge-ti-am572x DISTRO=ledge-gw source ./setup-environment
bitbake lmp-gateway-image

