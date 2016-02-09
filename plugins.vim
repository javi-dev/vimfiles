filetype off                  " required

"Set the runtime path to include Vundle and initialize.
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tobyS/vmustache'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
