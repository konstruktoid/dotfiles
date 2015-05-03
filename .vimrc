set ruler
set modeline

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

match ExtraWhitespace /\s\+$/

autocmd BufWinEnter * match ExtraWhitespace /^\t*\zs \+/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /^\t*\zs \+/
autocmd BufWinLeave * call clearmatches()
autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

au BufEnter * set ai sw=2 ts=2 sta et fo=croql
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql
