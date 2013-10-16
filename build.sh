ROOT=/root
TAG=precise
YOURNAME=binaryphile
YOURREPO=ruby
YOURTAG=2.0.0-p247
UID=65534

ID=$(docker run -d -u $UID -v $(pwd):$ROOT -e HOME=$ROOT -e ROOT=$ROOT ubuntu:$TAG $ROOT/install.sh)
docker commit $ID $YOURNAME/$YOURREPO $YOURTAG
docker rm $ID

