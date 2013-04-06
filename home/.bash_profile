#OS
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export OS="ubuntu"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export OS="osx"
else
    exit
fi

# Bash functions
if [ -f ~/.bash_functions ]; then
  source ~/.bash_functions
fi

# setup some basic variables
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export HOMEBREW_LLVM=true

: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

# Compilation
export ARCHFLAGS="-arch x86_64"

# bash-completion
if [[ "$OS" == "osx" && -f `brew --prefix`/etc/bash_completion ]]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -d ~/.bash_completion.d ]; then
  for file in ~/.bash_completion.d/*; do
    source $file
  done
fi

# rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion


# tmxu
alias tmux="TERM=xterm-256color tmux"

# editor
export EDITOR='vim'
export VISUAL='vim'


# Misc
export PAGER='less'
export CLICOLOR='yes'
export INPUTRC='~/.inputrc'

# Alias ###################################################################
alias cdd='cd - ' # goto last dir cd'ed from
alias ts='date +%Y%m%d%H%M%S'
alias http-server='python -m SimpleHTTPServer'

# OS bash_profile
source ~/.bash_profile-${OS}

# PATH
export PATH=~/.bin:$PATH

export NOSE_REDNOSE=1

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoredups
# Make some commands not show up in history
HISTIGNORE="ls:cd:cd -:pwd:exit"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

##################
# Code # Color   #
##################
#  00  # Off     #
#  30  # Black   #
#  31  # Red     #
#  32  # Green   #
#  33  # Yellow  #
#  34  # Blue    #
#  35  # Magenta #
#  36  # Cyan    #
#  37  # White   #
##################

# Dark colors: \[\033[0;??m\]
# Light colors: \[\033[1;??m\]

function color {
    echo "\[\033[$1;$2m\]"
}

c_prompt=`color 0 33`
c_path=`color 0 32`
c_branch=`color 0 31`
c_tag=`color 1 34`
c_off=`color 0 00`

function git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function git_tag {
    tag=`git describe --exact-match --tags HEAD 2> /dev/null`
    [ -z "$tag" ] && return 1

    echo " $tag"
}

PS1="${c_prompt}[\u@\h ${c_path}\W$c_branch\$(git_branch)$c_tag\$(git_tag)${c_prompt}]${c_off} "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

unset color_prompt force_color_prompt
unset c_prompt c_path c_branch c_tag c_off
