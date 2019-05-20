syntax on
set number
set tags=./tags;,tags;
colorscheme elflord
set smartindent
set hlsearch
nmap <Space> i_<Esc>r
set modeline
set modelines=5
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"COMMENTS
" lhs comments
map ,3 :s/^/##/<CR>
map ,4 :s/^/\/\//<CR>
map .3 :s/^##//<CR>
map .4 :s/^\/\///<CR>

" wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>
map .* :s/^\/\*\(.*\)\*\/$/\1/<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>
map .< :s/^<!-- \(.*\) -->$/\1/<CR>
"/COMMENTS
set mouse=a " mouse scrolling on mac
