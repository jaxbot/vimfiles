# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# In ~/.oh-my-zsh/themes/
ZSH_THEME="awesomepanda"

# Show dots while loading completion
COMPLETION_WAITING_DOTS="true"

plugins=(git ant osx brew gradle npm node sudo tmux github themes)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/jonathan/android/platform-tools:$PATH"
export EDITOR='vim'
bindkey -v
bindkey '^R' history-incremental-pattern-search-backward

# Enable node version manager
source $(brew --prefix nvm)/nvm.sh
export NVM_DIR="/Users/jonathan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Have each shell use its own history, instead of combining them globally
setopt APPEND_HISTORY

