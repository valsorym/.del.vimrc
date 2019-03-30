#!/bin/sh
# VALSORYM/VIM-RC UPGRADE
# Author: valsorym <i@valsorym.com>

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

# Go settings.
gocode close
go get -u github.com/nsf/gocode
exists=`cat $HOME/.bashrc | grep GOPATH`
if [ -z exists ]
then
  echo "" >> $HOME/.bashrc
  echo "export GOPATH=$HOME/go" >> $HOME/.bashrc
  echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> $HOME/.bashrc
fi

exit 0
