b=$(tput bold; tput setaf 4)
bb=$(tput bold; tput setaf 0)
r=$(tput sgr0)

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin

export HTTPS_PROXY=
export http_proxy=$HTTP_PROXY
export https_proxy=$HTTPS_PROXY
export ANSIBLE_SCP_IF_SSH=y
export HISTTIMEFORMAT="%y%m%d-%H:%M:%S "
export HOMEBREW_NO_ANALYTICS=1
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
export LANG=C

set -o posix

unset HISTFILE
export LESSHISTFILE="-"
