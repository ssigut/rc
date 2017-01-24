#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -f "${DIR}/.vimrc" ]
  then
    ln -s "${DIR}/.vimrc" "$HOME/.vimrc"
fi
