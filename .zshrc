# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="awesomepanda"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git ant osx brew gradle npm node sudo tmux github themes)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/Users/jonathan/android/tools:/Users/jonathan/android/build-tools:/Users/jonathan/android/platform-tools:/Users/jonathan/android/platforms:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"

export EDITOR='vim'
export ANDROID_HOME="/Users/jonathan/android/"

bindkey -v

alias widget="cd ~/www/materia/current/static/sandbox"

bindkey '^R' history-incremental-pattern-search-backward

export NVM_DIR="/Users/jonathan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
