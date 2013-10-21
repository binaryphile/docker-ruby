#!/bin/bash

if [ -e .env ]; then
  source .env
fi

: ${RUBY_VERSION?"need to set ruby version RUBY_VERSION, see README.md"}
: ${RI_VERSION?"need to set ruby-install version RI_VERSION, see README.md"}
: ${CR_VERSION?"need to set chruby version CR_VERSION, see README.md"}

: ${ROOT=/root}
: ${SOURCE_LIST="-o Dir::Etc::SourceList=$ROOT/sources.list"}
export DEBIAN_FRONTEND=noninteractive

apt-get $SOURCE_LIST update
apt-get install -y git build-essential curl
apt-get clean
cd $ROOT/ruby-install-$RI_VERSION
make install
ruby-install -s $ROOT/src ruby $RUBY_VERSION
echo "gem: --no-ri --no-rdoc" > /.gemrc
/opt/rubies/ruby-$RUBY_VERSION/bin/gem update --system
/opt/rubies/ruby-$RUBY_VERSION/bin/gem install bundler
cd $ROOT/chruby-$CR_VERSION
make install

