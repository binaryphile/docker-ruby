#!/bin/bash

if [ -e .env ]; then
  source .env
fi

: ${RUBY_VERSION?"need to set ruby version RUBY_VERSION, see README.md"}
: ${RI_VERSION?"need to set ruby-install version RI_VERSION, see README.md"}

: ${ROOT=/root}
: ${SOURCE_LIST="-o Dir::Etc::SourceList=$ROOT/sources.list"}
export DEBIAN_FRONTEND=noninteractive

apt-get $SOURCE_LIST update
apt-get $SOURCE_LIST install -y git build-essential curl
apt-get clean
cd $ROOT/ruby-install-$RI_VERSION
make install
ruby-install -s $ROOT/src -i /usr/local/ ruby $RUBY_VERSION
gem update --system
gem install bundler

