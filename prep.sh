RI_VERSION=0.3.0
RI_ARCHIVE=ruby-install-$RI_VERSION.tar.gz
RI_URL=https://github.com/postmodern/ruby-install/archive/v$RI_VERSION.tar.gz

wget -O $RI_ARCHIVE $RI_URL
tar -xzvf $RI_ARCHIVE

