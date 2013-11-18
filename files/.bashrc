#mark.turnley bashrc

system_name=`uname -s`

#[ -f ~/.aliases/colours] && . ~/.aliases/colours
#[ -f ~/.aliases/ps1_color] && . ~/.aliases/ps1_color
#[ -f ~/.aliases/git] && . ~/.aliases/git

umask 022

[ -f ~/./etc/bash_completion ] && . /etc/bash_completion
export EDITOR='vim'
#shopt -s globstar

alias hg='history | grep'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias ll='ls -l'
alias ls='ls -hF'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |less'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls

#use gnu sed
alias sed=gsed

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' -ls ; }

function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }

#[ -f ~/.aliases/commands] && . ~/.aliases/commands

#alias gm='git fetch && git merge --no-ff'
alias b='bundle exec'

if [ -f /etc/bashrc ]; then
  . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi


#finished loading this file ;)
echo "The Walrus said"
