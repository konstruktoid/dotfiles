set ruler
set modeline

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

match ExtraWhitespace /\s\+$/

au BufEnter * set ai sw=2 ts=2 sta et fo=croql
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
au BufWinEnter * match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /^\t*\zs \+/

au BufWinLeave * call clearmatches()

au BufWritePost *.sh !shellcheck %
au BufWritePost *.py !flake8 %

au FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
au FileType python set tabstop=4|set shiftwidth=4|set expandtab

au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au InsertLeave * match ExtraWhitespace /^\t*\zs \+/
