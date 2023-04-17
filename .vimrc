set cryptmethod=blowfish2
set encoding=utf-8
set fileencoding=utf-8
set maxmempattern=25000
set modeline
set nobackup
set noswapfile
set nowritebackup
set number
set paste
set relativenumber
set ruler
set viminfo=
syntax on

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

match ExtraWhitespace /\s\+$/

au BufEnter * set ai sw=2 ts=2 sta et fo=croql
au BufEnter *.go set ai sw=8 ts=8 sta et fo=croql
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql
au BufEnter *.rs set ai sw=4 ts=4 sta et fo=croql

au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
au BufWinEnter * match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /^\t*\zs \+/

au BufWinLeave * call clearmatches()

au BufWritePost *.go !gofmt -w %
au BufWritePost *.md !mdl %
au BufWritePost *.pp !puppet-lint %
au BufWritePost *.py !black %
au BufWritePost *.py.j2 !black %
au BufWritePost *.py !ruff check --select ALL --ignore ANN --ignore D --ignore INP --ignore PTH --ignore T20 .
au BufWritePost *.py.j2 !ruff check --select ALL --ignore ANN --ignore D --ignore INP --ignore PTH --ignore T20 .
au BufWritePost *.py !codespell %
au BufWritePost *.sh !shellcheck -x --format gcc %
au BufWritePost *.sh.erb !shellcheck -x --format gcc %
au BufWritePost *.yaml !yamllint %
au BufWritePost *.yml !yamllint %
au BufWritePost Dockerfile* !hadolint %
au BufWritePost *.ts !deno --unstable lint %
au BufWritePost *.ts !deno fmt --check %

au BufWritePre * :%s/\s\+$//e

au FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
au FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist
au FileType python set tabstop=4|set shiftwidth=4|set expandtab
au FileType make setlocal noexpandtab
au FileType rust setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist

au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au InsertLeave * match ExtraWhitespace /^\t*\zs \+/
