"We want the latest Vim settings/options.
set nocompatible
"The default is \, but a comma is much better.
let mapleader=','
"Source the plugins file.
so $HOME/vimfiles/plugins.vim
"Source the laravel specific file.
so $HOME/vimfiles/laravel.vim
"Enable syntax highlighting.
syntax enable
"Make backspace behave like every other editor.
set backspace=indent,eol,start
"No bells, tyvm
set noerrorbells visualbell t_vb=
"Automatically write the file. See :help for when.
set autowriteall
"Use UTF-8 instead of the default Latin-1
set encoding=utf-8
"Make a copy of the file when saving instead of renaming
"This ensures watchers (like webpack) to be notified of changes to files
set backupcopy=yes

"--------------Indentation---------------"
filetype plugin indent on
"Show existing tab with 8 spaces width.
set tabstop=8
"On pressing tab in insert mode, use 4 spaces width.
set softtabstop=4
"When indenting with '>', use 4 spaces width.
set shiftwidth=4
"On pressing tab, insert 4 spaces.
set expandtab
"/
"JavaScript
"/
autocmd FileType javascript setlocal softtabstop=2 shiftwidth=2

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
nmap <Leader>ev :tabedit $HOME\vimfiles\vimrc.vim<cr>
"Clear the highlighted search.
nmap <Leader><space> :nohlsearch<cr>
"Fix PSR-2 in the current file using php-cs-fixer.
nmap <Leader>p2 :!php-cs-fixer fix "%" --level=psr2<cr>
"Fix PSR-2 in the current file using phpcbf.
nmap <Leader>pb :!phpcbf --standard=PSR2 "%"<cr>

"-------------Plugins--------------"
"/
"/ CtrlP
"/
"We don't want to look into these folders.
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"Display CtrlP at the top, sort top to bottom, 30 results.
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    let s:ctrlp_fallback = 'ag -i --nocolor --nogroup --hidden -g "" %s'
elseif executable('ack-grep')
    let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
elseif executable('ack')
    let s:ctrlp_fallback = 'ack %s --nocolor -f'
elseif (has("win32") || has("win64") || has("win95") || has("win16"))
    let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
else
    let s:ctrlp_fallback = 'find %s -type f'
endif
if exists("g:ctrlp_user_command")
    unlet g:ctrlp_user_command
endif
let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': s:ctrlp_fallback
            \ }

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
"/
" Syntastic
"/
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"/
" Syntastic PHP
"/
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2'
"/
" Sytastic JavaScript
"/
let g:syntastic_javascript_checkers=['standard']
"/
" vim-php-namespace
"/
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>
"/
" Emmet
"/
imap <expr> <Leader><Tab> emmet#expandAbbrIntelligent("\<tab>")

"--------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
