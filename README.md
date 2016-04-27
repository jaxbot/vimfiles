## My vimfiles

Here's my awesome collection of my vimfiles, along with a few other dotfiles and misc tools.

They center around:

* Node.js
* HTML5/CSS3/JS
* git
* Functionality

and the "living in the editor" lifestyle.

It's here primarily to make it easy to sync up my systems, but if you want learn from them, suggest changes, etc., be my guest!

### Instructions

```
git clone git@github.com:jaxbot/vimfiles.git ~/.vim/
git submodule init
git submodule update

./link

:PluginInstall
```

Booyah!

### My vim version

On OSX:

```
brew update
brew install python

# vim
brew install macvim --override-system-vim --custom-icons --with-lua

# neovim
brew install neovim/neovim/neovim
pip3 install neovim
```

