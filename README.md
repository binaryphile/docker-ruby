# General-purpose Ruby Docker Image

**NOTICE:** due to the heartbleed bug, I've updated the 2.0.0-p247 image
to the latest Ubuntu 12.04, as of June 6, 2014.  If you were using the
old one, I strongly suggest you update your image to the new tag,
`binaryphile/ruby:2.0.0-p247-hb`.  These files and associated images are
provided AS-IS under the terms in the included file `LICENSE.txt`.

### Description

Creates a Docker image with Ruby, rubygems and bundler.

Before you go building 2.0.0-p247, you can already use my image by
running:

    docker pull binaryphile/ruby:2.0.0-p247-hb

**New**: MRI 2.1.2 is also now available as `binaryphile/ruby:2.1.2`.
Enjoy.

Also, if you want to know where the Dockerfile is, there isn't one.
`dockerfile.sh` is a shell script which performs the steps that a
Dockerfile would, which is why it is named that way.

The image is meant to be reusable, so you should only need to build a
new image if you need a version of ruby other than 2.0.0-p247, otherwise
you should just use mine.

### Usage

- Copy `sample.env` to `.env`
- Edit `.env` and set:
  - **RUBY_VERSION**: the version of Ruby you want to install, as
  ruby-install would refer to it.  Only specify a patch level if you
  need something other than the latest released version, e.g.
  2.0.0-p247.  New minor revisions of Ruby generally do not include the
  patch level in the download name and so can't include the patch level
  here.
  - **RI_VERSION**: the version of [ruby-install] to use
- (optional) if you have a preferred ubuntu mirror, you can change the
line in `.env` which refers to "ubuntu.wikimedia.org"
- run `./dockerfile.sh` and wait for it to finish
- determine the id of the finished container with `docker ps -l` (use
sudo if need be)
- (optional) commit the image: `docker commit [id]
[your-index-name]/[your-repo-name][:optional tag]`
- (optional) push your image: `docker push
[your-index-name]/[your-repo-name]`

### Troubleshooting

You can uncomment the "CMD=/bin/bash" line in `.env` to make
`dockerfile.sh` give you an interactive shell inside the container prior
to running `install.sh`.

### Contents

The resulting image will contain a ruby interpreter installed in
`/usr/local` that will be on your regular path, so you'll have access to
ruby, gem, etc.  If you are running bundler as a regular user, you'll
want to pass it the `--path [pathname]` option to tell it not to use the
system gems, since they'll fail when running as a regular user.

[ruby-install]: https://github.com/postmodern/ruby-install
