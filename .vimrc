" This vimrc file expects that several bundles are installed.
" Install them by cloning their git repos into ~/.vim/bundle
" and following any installation requirements found in git.

" List of required bundles:
" vim-pathogen
" TagBar
" YouCompleteMe
" vim-airline
" vim-flake8
" badwolf colorscheme
" zenburn colorscheme

" Happy vim-time


" Infect!
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" TagBar tuning
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F9> :TagbarOpen fj<CR>
" let g:tagbar_ctags_bin='...'

" YouCompleteMe tuning
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vim-airline tuning
set laststatus=2
set ttimeoutlen=50

" vim-flake8 tuning (remember to 'pip install --upgrade flake8' for proper python version)
filetype plugin on
autocmd FileType python map <buffer> <leader>c :call Flake8()<CR>

" increase yank line limit to 1000 lines and 1000kB
set viminfo='20,<1000,s1000

" other settings
set encoding=utf-8
set showmatch

" custom shortcuts
xnoremap <leader>s( xa()<Esc>P
xnoremap <leader>s' xa''<Esc>P
xnoremap <leader>s" xa""<Esc>P
xnoremap <leader>s{ xa{}<Esc>P
xnoremap <leader>s[ xa[]<Esc>P

" set backspace and arrows to behave as you would expect on modern system
set backspace=2
set whichwrap+=<,>,h,l,[,]

" syntax highlight
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
set t_Co=256
set number
syntax on
colorscheme badwolf
nnoremap <F6> :colorscheme zenburn<CR>
nnoremap <F7> :colorscheme badwolf<CR>

" tab will be 4 chars wide
set softtabstop=4
set shiftwidth=4
set autoindent

" case insensitive search
set incsearch ignorecase hlsearch

" auto expand tab -> 4 spaces (but not for Makefile)
set expandtab
autocmd FileType make setlocal noexpandtab

" make tabs and trailing whitespaces visible
set list
set listchars=tab:>.,trail:.

" press space to clear search highlighting and any message already displayed
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" highlight long lines for python files
"au BufWinEnter *.py let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
