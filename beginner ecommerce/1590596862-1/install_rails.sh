#!/bin/sh

# From Beginning Rails, pages 27-28
# Installs Ruby and Rails on OS X 10.4.x~
#
# This script does not install MySQL. This is because MySQL includes a great
# installer for OS X that automatically creates a startup script and a handy
# preference pane to control the daemon. Download the most recent stable
# version of MySQL for OS X (package format) and install it using the bundled
# installer.
#
# This script will take care of the rest.
#
# Make sure you have the Apple Developer Tools (XCode) installed, and that
# your profile (~/.bash_profile || ~/.basrc || ~/.profile) has a PATH that
# includes whatever you set as the PREFIX below (usually /usr/local/bin).
# Directories in the PATH are separated using a colon (:) and searched in
# order from left to right.
#
# Example (/usr/local/bin will be searched first):
#
#   PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin
#
# If you change your profile, reload your shell by opening a new one, or by
# typing:
#
#   source ~/.bash_profile
#
# Where ~/.bash_profile is the location of your profile file. This will cause
# your shell to re-read the profile.
#
# View the contents of your PATH variable and make sure it's correct by
# typing:
#
#   echo $PATH
#
# Make sure your environment has access to a compiler (it's installed as part
# of the Apple Developer (XCode) Tools). You should see version information
# about your compiler by typing:
#
#   gcc --version
#
# If you see an error, you probably didin't install the Developer Tools.
#
# Run this script by making it executable and invoking it using sudo:
#
#   chmod +x install_rails.sh
#   sudo ./install_rails.sh
#
PREFIX="/usr/local"
READLINE_VERSION="5.2"
RUBY_VERSION="1.8.5-p12"
GEM_VERSION="0.9.1"

curl -O ftp://ftp.gnu.org/gnu/readline/readline-${READLINE_VERSION}.tar.gz
tar xzvf readline-${READLINE_VERSION}.tar.gz
pushd readline-${READLINE_VERSION}
./configure --prefix=${PREFIX}
make
make install
popd

curl -O ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-${RUBY_VERSION}.tar.gz
tar xzvf ruby-${RUBY_VERSION}.tar.gz
pushd ruby-${RUBY_VERSION}
./configure --prefix=${PREFIX} --enable-pthread --with-readline-dir=${PREFIX}
make
make install
popd

curl -OL http://rubyforge.org/frs/download.php/16452/rubygems-${GEM_VERSION}.tgz
tar xzvf rubygems-${RUBYGEMS_VERSION}.tgz
pushd rubygems-${RUBYGEMS_VERSION}
ruby setup.rb
popd

gem install rails --include-dependencies
