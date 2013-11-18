export PATH="~/.bin:/usr/local/bin:$PATH"

#nothing here yet
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=$HOME/.rbenv/bin:/usr/local/sbin:$PATH
eval "$(rbenv init -)"


bin d'"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'

HISTSIZE=100000
export HISTSIZE
export RUBY_GC_MALLOC_LIMIT=64000000
ssh-add

echo "'The time has come'"

[ -f ~/.bashrc ] && . ~/.bashrc
