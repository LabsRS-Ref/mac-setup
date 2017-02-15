#!/bin/sh
#
# Mac OS X Automated Installer Bash Profile Configuration
# 
# Copyright 2016 - Bryan R. Hoffpauir, Jr.
#
# TODO - Review all commands setting a PATH and make sure there's no conflicts and that 
#	the implementation is idempotent.

# Set USER's local bin directory path
export LOCALBIN="$HOME/bin"

# Specify your defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/opt/homebrew-cask/Caskroom/"


# Customize Prompt
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "


# Enable Pretty Shell Color Output
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# WHAT IS THIS FOR???
# export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:~/bin/pear/bin:~/bin:$(brew --prefix coreutils)/libexec/gnubin:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$(brew --prefix homebrew/php/php55)/bin:$PATH

# Ensure user-installed binaries take precedence
export PATH="/usr/local/bin:$PATH"


# Configure Java / jenv settings from Homebrew for PATH, shims & autocomplete
export JENV_ROOT="/usr/local/var/jenv"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi


# Set Go path per : https://golang.org/doc/code.html#GOPATH
export GOPATH="$HOME/work"
export PATH="$LOCALBIN:$PATH:$GOPATH/bin"


# Configure PATH for Virtualenv
export PATH="/usr/local/lib/python2.7/site-packages:$PATH"
source /usr/local/bin/virtualenvwrapper_lazy.sh


# Configure Node.js PATH
export NODE_PATH="/usr/local/lib/node_modules"


# If they exist, load secret credentials files (GIT ACCESS TOKEN / AWS CREDS, etc...)
test -f ~/mac-setup/.api_keys && source ~/mac-setup/.api_keys 


# If configured, activate bash auto-completion
test -f $(brew --prefix)/etc/bash_completion && source $(brew --prefix)/etc/bash_completion


# If configured, activate the bash-git-prompt add-in
# Need to determine how to customize so we don't lose PS1 details set above
# test -f $(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh &&  source $(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

