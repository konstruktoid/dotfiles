set ruler
set modeline
set cryptmethod=blowfish2
set nobackup
set nowritebackup
set viminfo=

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

match ExtraWhitespace /\s\+$/

au BufWritePost *.sh !shellcheck %
au BufWritePost *.go !gofmt -w %
au BufWritePost *.py !python -m flake8 --ignore=E501,F821 %
au BufWritePost *.pp !puppet parser validate --verbose %
au BufWritePost *.md !mdl %
au BufWritePost *.yml !yamllint %
au BufWritePost *.yaml !yamllint %

au BufEnter * set ai sw=2 ts=2 sta et fo=croql
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql
au BufEnter *.go set ai sw=8 ts=8 sta et fo=croql

au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
au BufWinEnter * match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /^\t*\zs \+/

au BufWinLeave * call clearmatches()

au FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
au FileType python set tabstop=4|set shiftwidth=4|set expandtab
au FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist

au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au InsertLeave * match ExtraWhitespace /^\t*\zs \+/

