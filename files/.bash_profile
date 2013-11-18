export PATH="~/.bin:/usr/local/bin:$PATH"
export PATH=$HOME/.rbenv/bin:/usr/local/sbin:$PATH

ssh-add

source /Users/mturnley/.bashrc
eval "$(rbenv init -)"

bin d'"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'

HISTSIZE=100000
export HISTSIZE
export RUBY_GC_MALLOC_LIMIT=64000000

black_background="\[\033[40m\]"
white="\[\033[1;37m\]"
blue="\[\033[0;34m\]"
yellow="\[\033[1;33m\]"
default_colour="\[\033[0m\]"

#date_piece="\[${color_gray}\]\$(date '+%a %H:%M:%S')\[${color_none}\]"
#PS1="${black_background}${white}\w${yellow}$(parse_git_branch)${default_colour} "
#export PS1="${date_piece} \u\[${color_green}\]@\[${color_ps1}\]\h\[${color_none}\] \[${color_gray}\]\w\n\[${color_green}\]\$\[${color_none}\] "
PS1="${blue}\w${yellow}\$(parse_git_branch)${default_colour} "

alias start_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM start"
alias stop_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM stop"
alias sed=gsed
alias b="bundle exec"

echo "'The time has come'"

