"We want the latest Vim settings/options.
set nocompatible
"Source the plugins file.
so $HOME/vimfiles/plugins.vim
"Enable syntax highlighting.
syntax enable
"Make backspace behave like every other editor.
set backspace=indent,eol,start
"The default is \, but a comma is much better.
let mapleader=','

"--------------Indentation---------------"
filetype plugin indent on
"Show existing tab with 4 spaces width.
set tabstop=4
"When indenting with '>', use 4 spaces width.
set shiftwidth=4
"On pressing tab, insert 4 spaces.
set expandtab

"-----------------Visuals----------------"
"Use 256 colors. This is useful for Terminal Vim.
set t_Co=256
"Apply the atom-dark colorscheme.
colorscheme  atom-dark
"Let's activate line numbers.
set number

"-----------------Search-----------------"
"Highlight search result(s).
set hlsearch
"Search incrementally.
set incsearch
"Ignore case.
set ignorecase

"------------Split Management------------"
"I prefer to open new splits below and to the right.
set splitbelow
set splitright
"I don't want to have to press <C-W> to move between splits.
nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>

"----------------Mappings----------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $HOME\vimfiles\vimrc<cr>
"Clear the highlighted search.
nmap <Leader><space> :nohlsearch<cr>
"Fix PSR-2 in the current file.
nmap <Leader>p2 :!php-cs-fixer fix "%" --level=psr2<cr>

"-------------Plugins--------------"
"/
"/ CtrlP
"/
"We don't want to look into these folders.
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"Display CtrlP at the top, sort top to bottom, 30 results.
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
"Use git for searches, and ignore what's already in the .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"Make CtrlP search for tags/symbols.
nmap <A-r> :CtrlPBufTag<cr>
"Make CtrlP show Most Recently Used files.
nmap <A-e> :CtrlPMRUFiles<cr>
"/
" NERDTree
"/
"Make NERDTree easier to toggle.
nmap <A-1> :NERDTreeToggle<cr>
"I want to use Vinegar for netrw, not NERDTree
let NERDTreeHijackNetrw = 0

"--------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
