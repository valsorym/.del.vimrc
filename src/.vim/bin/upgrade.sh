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

# Install vim-go.
# URL: https://github.com/fatih/vim-go
vim +PluginInstall +qall
vim +GoInstallBinaries +qall

exit 0
