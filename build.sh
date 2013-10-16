ROOT=/root
TAG=precise
YOURNAME=binaryphile
YOURREPO=ruby
YOURTAG=2.0.0-p247

ID=$(docker run -d -v $(pwd):$ROOT -e ROOT=$ROOT ubuntu:$TAG $ROOT/install.sh)
docker commit $ID $YOURNAME/$YOURREPO $YOURTAG
docker rm $ID

