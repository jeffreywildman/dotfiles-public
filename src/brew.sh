#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of tools.
brew install vim --override-system-vi
brew install python
brew install git

# Install other useful binaries.
brew install awscli
brew install bib-tool
brew install cscope
brew install gnuplot --with-aquaterm --without-emacs --with-pdflib-lite --with-latex
brew install macvim

# Link any apps.
brew linkapps macvim
brew linkapps python

# Remove outdated versions from the cellar.
brew cleanup
