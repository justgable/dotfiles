# -------
# General oh-my-zsh settings
# -------

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"

# Make sure you symlink this theme from the dotfiles repo first
ZSH_THEME="justin"

# -------
# Unix
# -------
# alias u='sudo -u
# u() { sudo -u "$*" zsh; }

# ------
# Default zsh settings
# ------

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
plugins=(git)

# -------
# PATHS
# -------

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Use this as a starting point for $PATH in .zshrc
# export PATH=/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/share/npm/bin

# -------
# Utility functions
# -------

## Create directory tree and cd into last directory
# Take(n) from kepford
function take () {
  mkdir -p "$1"
  cd "$1"
}

# Returns whether the given command is executable or aliased.
# Pulled from https://github.com/statico/dotfiles -- .zshrc
_has() {
  return $( whence $1 >/dev/null )
}

# -------
# Aliases
# -------
alias l='ls'
alias la='ls -a'
alias ll='ls -1a'
alias lah='ls -lah'
alias zshrc="vim -v ~/.zshrc"
alias vimrc="vim -v ~/.vimrc"
alias h='cd ~'
alias g='git'
alias gcam='git commit -v -a -m '
alias glog='git log --oneline'
alias gs='git status -sb'
alias gba="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

# -------
# TMUX
# -------
alias ta='tmux attach -t '
alias tl='tmux list-sessions'
alias tn='tmux new -s '
alias ts='tmux switch -t '
alias tk='mux stop '

# Load tmuxinator alias file
BIN_DIR="${HOME}/.bin"
if [ -f "$BIN_DIR/tmuxinator.zsh" ]; then
  source ${BIN_DIR}/tmuxinator.zsh
else
  echo >&2 "NOTICE: ${BIN_DIR}/tmuxinator.zsh is missing"
fi

# -------
# vim
# -------
export EDITOR='vim'
