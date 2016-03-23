syntax on
set number
set tags=~/backup/.git/tags
colorscheme elflord
set smartindent
set hlsearch
nmap <Space> i_<Esc>r
set modeline
set modelines=5

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

"PATHOGEN
execute pathogen#infect()
"phpcs integration
" Use the following for checking php files
let g:syntastic_php_checkers = ['php', 'phpcs']
" Aggregate all the errors together
let g:syntastic_aggregate_errors = 1
" Set phpcs args
let g:syntastic_php_phpcs_args="--standard=/Users/ccrabtree/backup/.phpcs/PHP_CodeSniffer/Barracuda/ruleset.xml"

"Syntastic Configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

source ~/.vim/php-doc.vim 
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 
