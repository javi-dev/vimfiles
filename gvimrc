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

"=========== Font ===========
"Set font type and font size.
set guifont=Fira_Code:h17
"Graphical Vim specific line-height.
set linespace=15

"=========== Full Screen ===========
"Activate/deactivate full screen with function key <F11>.
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

"I think this loads the full screen plugin or something.
augroup fullscreen
	autocmd!
	autocmd VimEnter * call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
augroup END
