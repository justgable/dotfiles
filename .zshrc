# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="justin"

# Aliases
alias zshrc="mvim -v ~/.zshrc"
alias vimrc="mvim -v ~/.vimrc"
alias l='ls -l'
alias la='ls -la'
alias lah='ls -lah'
alias vim='mvim -v'
alias ar='sudo apachectl -k restart'
alias av='sudo vim /etc/apache2/other/httpd-vhosts.conf'
alias d6='cd ~/www/drupal6.dev/sites/'
alias d7='cd ~/www/drupal7.dev/sites/'
alias d8='cd ~/www/drupal-8.x-dev/sites/'
alias wr='cd ~/www'
alias wl='cd ~/wasteland'
alias h='cd ~'
alias phpc='php app/console'
alias v='vagrant'

# FCOE aliases
alias sshitsa='ssh itsadmin@10.5.6.182'
alias sshitsa2='ssh itsadmin@10.5.6.184'

# git alisas
alias g='git '

# Added for PEAR
alias pear="php /usr/lib/php/pear/pearcmd.php"
alias pecl="php /usr/lib/php/pear/peclcmd.php"

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


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails osx)

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
export EDITOR="mvim -v"

source $ZSH/oh-my-zsh.sh
#source ~/local/node/lib/node_modules/npm/lib/utils/completion.sh
unsetopt correct_all

# Customize to your needs...
#export PATH=/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/local/node/bin:/Users/jgable/android-sdks/tools:/Users/jgable/android-sdks/platform-tools
export PATH=/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/jgable/android-sdks/tools:/Users/jgable/android-sdks/platform-tools:/opt/vagrant/bin

# For homebrew apps to use non-homebrew Python
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH=/System/Library/Frameworks/Python.framework/Versions/2.7/include/python2.7:$PYTHONPATH

# PATH=$PATH:$HOME/.rvm/bin:$HOME/.rvm/gems/ruby-1.9.3-p125@global # Add RVM to PATH for scripting
