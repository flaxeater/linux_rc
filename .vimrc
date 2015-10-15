syntax on
set number
set tags=~/backup/.git/tags
colorscheme elflord
nmap <Space> i_<Esc>r

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
