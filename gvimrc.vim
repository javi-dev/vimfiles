"=========== Options ===========
"Remove menu bar
set guioptions-=m
"Remove toolbar
set guioptions-=T
"Remove right-hand scroll bar
set guioptions-=r
"Remove left-hand scroll bar
set guioptions-=L
"We don't want Gui tabs.
set guioptions-=e
"Hide the left and right scrollbars on windows and splits
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
"Get rid of the background color for the line numbers.
hi LineNr guibg=bg
"Get rid of the vertical split borders
hi vertsplit guifg=bg guibg=bg
"Even if it's set in the .vimrc, it gets overwritten by the GUI,
"so it must be set again here
set visualbell t_vb=

"=========== Font ===========
"Set font type and font size.
set guifont=Fira_Code:h17
"Graphical Vim specific line-height.
set linespace=15

"=========== Full Screen ===========
"Start in fullscreen
autocmd GUIEnter * silent! WToggleFullscreen
"Activate/deactivate full screen with function key <F11>.
map <F11> :WToggleFullscreen<CR>
