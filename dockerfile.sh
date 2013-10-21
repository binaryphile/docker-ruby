#!/bin/bash

if [ -e .env ]; then
  source .env
fi

: ${RI_VERSION?"need to set ruby-install version RI_VERSION, see README.md"}
: ${CR_VERSION?"need to set chruby version CR_VERSION, see README.md"}

: ${ROOT=/root}
: ${IMAGE=ubuntu:precise}
: ${RI_PATH=ruby-install-$RI_VERSION}
: ${RI_URL=https://codeload.github.com/postmodern/ruby-install/tar.gz/v$RI_VERSION}
: ${CR_PATH=chruby-$CR_VERSION}
: ${CR_URL=https://codeload.github.com/postmodern/chruby/tar.gz/v$CR_VERSION}
: ${OPTIONS="-i -t -w $ROOT -v $(pwd):$ROOT -e HOME=$ROOT -e ROOT=$ROOT"}
: ${CMD=$ROOT/install.sh}

if [ ! -d $RI_PATH ]; then
  curl $RI_URL | tar -xzvf -
fi
if [ ! -d $CR_PATH ]; then
  curl $CR_URL | tar -xzvf -
fi
docker run $OPTIONS $IMAGE $CMD

