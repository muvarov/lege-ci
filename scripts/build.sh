#!/bin/bash

set -e
cd ~
mkdir oe-linaro-ledge
cd oe-linaro-ledge

repo init -u https://git.linaro.org/people/christophe.priouzeau/oe-lite-manifest.git
repo sync

MACHINE=ledge-ti-am572x DISTRO=ledge-gw source ./setup-environment
bitbake lmp-gateway-image

