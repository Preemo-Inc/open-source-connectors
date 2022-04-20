#!/bin/bash
set -x

# Brew Install Components
brew install asdf

asdf plugin add python

asdf install
