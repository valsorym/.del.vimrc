#!/bin/sh
# VALSORYM/VIM-RC INSTALL
# Author: valsorym <i@valsorym.com>

# Get base directory.
SCRIPT_DIR=`dirname $0`
cd $SCRIPT_DIR/../
BASE_DIR=`pwd -P`

# Copy the basic settings.
mkdir -p $BASE_DIR/.vim/bundle
cp -Rf $BASE_DIR/src/.vim \
       $BASE_DIR/src/.vimrc \
       $BASE_DIR/src/.gvimrc \
       $HOME

# Scan ~/.vimrc and find all plugins that must be installed use vundle.
PLUGINS=`cat $HOME/.vimrc | grep "Plugin '*'" | cut -d"'" -f2`
for plugin in $PLUGINS
do
    name=`echo $plugin | cut -d"/" -f2`
    echo "Processed: $name"
    git clone https://github.com/${plugin} $HOME/.vim/bundle/$name
done

# Upgrade.
bash $HOME/.vim/bin/upgrade.sh

echo "Done!"
exit 0
