#!/usr/bin/env bash

if [ -e .env ]; then
  source .env
fi

: ${RUBY_VERSION?"need to set ruby version RUBY_VERSION, see README.md"}
: ${RI_VERSION?"need to set ruby-install version RI_VERSION, see README.md"}

: ${ROOT=/root}
export DEBIAN_FRONTEND=noninteractive

if [ -n "$MIRROR"  ]; then
  sed -i -e "s/archive.ubuntu.com/$MIRROR/g" /etc/apt/sources.list
fi
apt-get update
apt-get install -y git-core build-essential curl
apt-get clean
cd $ROOT/ruby-install-$RI_VERSION
make install
ruby-install -s $ROOT/src -i /usr/local/ ruby $RUBY_VERSION
gem update --system
gem install -f bundler rake
