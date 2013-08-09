### General oh-my-zsh settings

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Make sure you symlink this theme from the dotfiles repo first
# ZSH_THEME="justin"


### Aliases
alias l='ls -l'
alias la='ls -la'
alias lah='ls -lah'
alias zshrc="vim -v ~/.zshrc"
alias vimrc="vim -v ~/.vimrc"
alias ar='sudo apachectl -k restart'
alias h='cd ~'
alias g='git'
alias gcam='git commit -v -a -m '

# Unix
# alias u='sudo -u
# u() { sudo -u "$*" zsh; }

# OSX
# alias vim='mvim -v'
# alias av='vim /www/httpd-vhosts.conf'
# alias wr='cd ~/www'
# alias wl='cd ~/wasteland'
# alias pear="php /usr/lib/php/pear/pearcmd.php" 
# alias pecl="php /usr/lib/php/pear/peclcmd.php" 

# Work aliases
# ssh... = username@domain


### Default zsh settings

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? 
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Useful plugins (git ruby rails osx)
plugins=(git ruby rails)

### PATHS

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
# export PATH=/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/share/npm/bin

# tmuxinator
# [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
# export EDITOR="mvim -v"

# For homebrew apps to use non-homebrew Python
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
# export PYTHONPATH=/System/Library/Frameworks/Python.framework/Versions/2.7/include/python2.7:$PYTHONPATH

# Add RVM to PATH for scripting
# PATH=$PATH:$HOME/.rvm/bin:$HOME/.rvm/gems/ruby-2.0.0-p247@global 

# Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
