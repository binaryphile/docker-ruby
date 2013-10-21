# General-purpose Ruby Docker Image

## Description

Creates a Docker image with Ruby, rubygems and bundler.

Before you go building 2.0.0-p247, you can already use my image by
running:

    docker pull binaryphile/ruby:2.0.0-p247

## Usage

- Copy `sample.env` to `.env`
- Edit `.env` and set:
  - **RUBY_VERSION**: the version of Ruby you want to install including
  patch level, e.g. 2.0.0-p247
  - **RI_VERSION**: the version of [ruby-install] to use
  - **CR_VERSION**: the version of [chruby] to use
- run `./dockerfile` and wait for it to finish
- determine the id of the finished container with `docker ps -l` (use
sudo if need be)
- (optional) commit the image: `docker commit [id]
[your-index-name]/[your-repo-name][:optional tag]`
- (optional) push your image: `docker push
[your-index-name]/[your-repo-name]`

## Contents

The resulting image will contain a ruby interpreter installed in
/opt/rubies/[version], according to the [ruby-install] method.

You will want to run [chruby] before trying to use ruby in the
container.  You'll need to do this any time you create a ruby process
inside the container.  The standard way is two commands:

- `source /usr/local/share/chruby/chruby.sh`
- `chruby [version]`, e.g. `chruby 2.0`

