#!/bin/sh
# VALSORYM/VIM-RC UPGRADE
# Author: valsorym <i@valsorym.com>

# Go settings.
PROFILE="$HOME/.profile"
if [ ! -s "$PROFILE" ]
then
  touch "$PROFILE"
fi

exists=`cat "$PROFILE" | grep GOPATH`
if [ -z "$exists" ]
then
  echo "" >> "$PROFILE"
  echo "export GOPATH=\$HOME/go" >> "$PROFILE"
  echo "export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin" >> "$PROFILE"
fi

gocode close
go get -u github.com/nsf/gocode

# Merge specific files: colors syntax keymap compiler ftdetect ftplugin indent.
for dir in `find $HOME/.vim/bundle -type d`
do
    dirname=`basename "$dir"`
    case "$dirname" in 
        "colors"|"syntax"|"keymap"|"compiler"|"ftdetect"|"ftplugin"|"indent")
            echo "cp -Rf '$dir'/* '$HOME/.vim/$dirname/'"
            mkdir -p $HOME/.vim/$dirname
            cp -Rf "$dir"/* "$HOME/.vim/$dirname/"
            ;;
    esac
done

# Install and setting plugins.
vim +PluginInstall +qall
vim +GoInstallBinaries +qall

exit 0
