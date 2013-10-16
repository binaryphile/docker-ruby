# General-purpose Ruby Docker Image

## Description

Creates a Docker image with Ruby, rubygems and bundler.

Before you go building 2.0.0-p247, you can already use my image by
running:

    docker pull binaryphile/ruby:2.0.0-p247

## Usage

Edit `build.sh` and `install.sh` for your particular variables.  Usually
just Ruby version and the desired repo/tag names, and perhaps Ubuntu
version.

Run `build.sh`.  It will start an Ubuntu container and run `install.sh`
inside.  `install.sh` will download [ruby-install] and build the
specified version of Ruby, then install rubygems and bundler.

Finally, `build.sh` will commit the created image.

You may want to push your image when you're done.

