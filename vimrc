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
"Apply the atom-dark colorscheme.
colorscheme  atom-dark
"Use 256 colors. This is useful for Terminal Vim.
set t_CO=256
"Let's activate line numbers.
set number
"Set font type and font size.
set guifont=Fira_Code:h17
"We don't want Gui tabs.
set guioptions-=e
"Graphical Vim specific line-height.
set linespace=15
"Hide the left and right scrollbars on windows and splits
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

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
nmap <Leader>ev :tabedit $MYVIMRC<cr>
"Clear the highlighted search.
nmap <Leader><space> :nohlsearch<cr>
"Activate/deactivate full screen with function key <F11>.
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
"Make NERDTree easier to toggle.
nmap <A-1> :NERDTreeToggle<cr>
"Make CtrlP search for tags/symbols.
nmap <c-R> :CtrlPBufTag<cr>
"Make CtrlP show Most Recently Used files.
nmap <A-e> :CtrlPMRUFiles<cr>
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
"/
" NERDTree
"/
"I want to use Vinegar for netrw, not NERDTree
let NERDTreeHijackNetrw = 0

"--------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
"I think this loads the full screen plugin or something.
augroup fullscreen
	autocmd!
	autocmd VimEnter * call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
augroup END
