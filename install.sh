#!/bin/bash

# install vimrc file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -f "${DIR}/.vimrc" ]
  then
    ln -s "${DIR}/.vimrc" "$HOME/.vimrc"
fi

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install badwolf and zenburn colorsheme
git clone https://github.com/sjl/badwolf.git ~/.vim/bundle/badwolf
git clone https://github.com/jnurmine/Zenburn.git ~/.vim/bundle/Zenburn

# install ctags and tagbar
sudo apt-get install ctags -y
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar

# install YouCompleteMe autocomplete
sudo apt install build-essential cmake python3-dev
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
pushd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py
# to get C semantic completion install libclang-7 and modify previous line to: python3 install.py --clang-completer
popd

# install vim-airline
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
