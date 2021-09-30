#!/usr/bin/env bash

initial_location="$(pwd)"
mkdir /home/$(whoami)/src
cd /home/$(whoami)/src
git clone git@github.com:pedro-hs/dotfiles.git
cd dotfiles
rm -rf "$initial_location/dotfiles"
