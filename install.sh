ROOT=/root
SOURCE_LIST="-o Dir::Etc::SourceList=./sources.list"
export DEBIAN_FRONTEND=noninteractive

apt-get $SOURCE_LIST update
apt-get install -y git wget build-essential
wget -O ruby-install-0.3.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.3.0.tar.gz
tar -xzvf ruby-install-0.3.0.tar.gz
cd ruby-install-0.3.0 && make install
ruby-install -i /usr/local/ ruby 2.0.0-p247
gem update --system
gem install bundler

apt-get clean

