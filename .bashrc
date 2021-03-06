# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# make sure you have .git-completion.bash under your $HOME/
source ~/.git-completion.bash

# alias
alias ll="ls -l"
alias dev="ssh dev"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias setup="virtualenv --no-site-packages env && source env/bin/activate"
alias godev="ssh -v chun-dev"
alias ctags="/usr/local/Cellar/universal-ctags/HEAD-3fdf28b/bin/ctags"

# @link http://www.jonmaddox.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' -e 's/((/(/' -e 's/))/)/'
}

function proml() {
    local GREEN="\[\033[0;32m\]"
    local BLUE="\[\033[0;34m\]"
    local PURPLE="\[\033[0;35m\]"
    local COLOR_END="\[\033[0m\]"
    if [ $USER = "root" ]; then
        local PREFIX="♔"
    else
        local PREFIX=""
    fi
    PS1="$COLOR_END$PURPLE\W$COLOR_END$GREEN\$(parse_git_branch)$COLOR_END$PURPLE$PREFIX$COLOR_END "
}
proml

case $TERM in
xterm*)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}"; echo -ne "\007"'
    ;;
screen)
    PROMPT_COMMAND='echo -ne "\033_${PWD/#$HOME/~}"; echo -ne "\033\\"'
    ;;
*)
    PROMPT_COMMAND=''
    ;;
esac

#LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"
# export TERM=xterm-256color

# User specific aliases and functions
#export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'
# colors for ls
#export LS_COLORS='no=00:fi=00:di=01;34:ln=00;04;31:pi=00;37:so=01;31:bd=37:cd=37:or=01;31:ex=01;31:*.o=01:*.gz=00;35:*.tar=00;35:*.Z=00;35:*.tgz=00;35:*.mpg=36:*.mpeg=36:*.dat=35:*.mov=35:*.pm=35:*.jpg=36:*.JPG=36:*.gif=36:*.GIF=36:*.ps=01;33:*.pdf=01;35:*.fm=01;35:*.htm=01;34:*.html=01;34:*.HTM=01;34:*.HTML=01;34:*.c=00;31:*.cpp=00;31:*.pl=00;31:*.my=01;04;35:*.man=01;04;07;30:*.ppt=35:*.DOC=35:*.doc=35:*.cmd=04;35:*.tcl=04;36:*.tclscript=04;36:*.log=04;35'
#alias grep='grep --color=auto'
#alias ls='ls -G'


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export NVM_DIR="/Users/shangchun/.nvm"
export INFRA_REPO_PATH="/Users/shangchun/Repo/adrise_infra"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by travis gem
[ -f /Users/shangchun/.travis/travis.sh ] && source /Users/shangchun/.travis/travis.sh

export ANDROID_HOME=/Users/shangchun/Library/Android/sdk
export GRADLE_HOME=/Applications/Android\ Studio.app/Contents/gradle/gradle-4.6
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${GRADLE_HOME}/bin
export PATH="${PATH}:/Users/shangchun/Repo/depot_tools"
export PATH="$HOME/miniconda/bin:$PATH"
