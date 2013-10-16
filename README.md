# General-purpose Ruby Docker Image

## Description

Creates a Docker image with Ruby, rubygems and bundler.

Before you go building 2.0.0-p247, you can already use my image by
running:

    docker pull binaryphile/ruby:2.0.0-p247

## Usage

Edit `prep.sh`, `build.sh` and `install.sh` for your particular
variables.  Usually just Ruby version and the desired repo/tag names,
and perhaps Ubuntu version.

Run `prep.sh` in this directory (on the host) to get ruby-install and
unpack it.

Before you run `build.sh`, find
`ruby-install-(version)/share/ruby-install/functions` and edit out the
first few lines which set the source dir and install dir for uid 0.
This will prevent the source from being put in the image.  You want the
source dir set to $HOME/src.  The install dir doesn't matter, it'll be
overwritten by the next install script.

Run `build.sh`.  It will start an Ubuntu container and run `install.sh`
for you inside the container.  `install.sh` will build the specified
version of Ruby, then install rubygems and bundler.

Finally, `build.sh` will commit the created image.

You may want to push your image when you're done.

