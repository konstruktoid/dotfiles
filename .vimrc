set cryptmethod=blowfish2
set modeline
set nobackup
set nowritebackup
set paste
set ruler
set viminfo=
syntax on

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

match ExtraWhitespace /\s\+$/

au BufEnter * set ai sw=2 ts=2 sta et fo=croql
au BufEnter *.go set ai sw=8 ts=8 sta et fo=croql
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
au BufWinEnter * match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /^\t*\zs \+/

au BufWinLeave * call clearmatches()

au BufWritePost *.go !gofmt -w %
au BufWritePost *.md !mdl %
au BufWritePost *.pp !puppet parser validate --verbose %
au BufWritePost *.pp !puppet-lint --no-80chars-check --no-140chars-check %
au BufWritePost *.py !python3 -m flake8 --ignore=E501,F821 %
au BufWritePost *.py.erb !python3 -m flake8 --ignore=E501,F821 %
au BufWritePost *.sh !shellcheck -x --format gcc %
au BufWritePost *.sh.erb !shellcheck -x --format gcc %
au BufWritePost *.yaml !yamllint %
au BufWritePost *.yml !yamllint %

au BufWritePre *.py :%s/\s\+$//e

au FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
au FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist
au FileType python set tabstop=4|set shiftwidth=4|set expandtab

au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au InsertLeave * match ExtraWhitespace /^\t*\zs \+/
