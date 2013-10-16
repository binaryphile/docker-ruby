ROOT=/root
RUBY_VERSION=2.0.0-p247
RI_VERSION=0.3.0
SOURCE_LIST="-o Dir::Etc::SourceList=./sources.list"
export DEBIAN_FRONTEND=noninteractive

apt-get $SOURCE_LIST update
apt-get install -y git build-essential
cd ruby-install-$RI_VERSION && make install
ruby-install -i /usr/local/ ruby $RUBY_VERSION
gem update --system
gem install bundler

apt-get clean

