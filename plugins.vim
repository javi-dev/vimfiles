filetype off                  " required

"Set the runtime path to include Vundle and initialize.
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tobyS/vmustache'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'stanangeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'ervandew/supertab'
Plugin 'kkoenig/wimproved.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mattn/emmet-vim'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'posva/vim-vue'
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
