## Setup
    
    # Fresh Debian/Ubuntu install
    sudo apt-get update && sudo apt-get upgrade
    sudo apt-get install git vim zsh tmux
    
    # Download Vundle to ~/.vim
    mkdir ~/.vim
    mkdir ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
    # Link .vimrc & run Vundle to install vim plugins
    ln -s ~/dotfiles/.vimrc ~/.vimrc
    vim +PluginInstal
    
    # Set zsh to defall
    chsh -s $(which zsh);

    # Install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    
    # Add ZSH theme
    cp ~/dotfiles/oh-my-zsh/custom/justin.zsh-theme ~/.oh-my-zsh/custom/

    # Finish up dotfiles setup
    echo 'source ~/dotfiles/.zshrc' > ~/.zshrc
    ln -s ~/dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
    ln -s ~/dotfiles/.screenrc ~/.screenrc
    ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
    
    # Install RVM & latest version of Ruby (for Tmuxinator)
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable

    # Install Tmux Plugin Manager
    take ~/.tmux/plugins; git clone https://github.com/tmux-plugins/tpm
    # Press `prefix` + `I` to install plugins
    
    # Install Tmuxinator
    gem install tmuxinator
    mkdir ~/.bin
    wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh --directory-prefix=.bin


## Font files

* **FiraCode:** https://github.com/tonsky/FiraCode
* **Roboto Mono:** https://fonts.google.com/specimen/Roboto+Mono?selection.family=Roboto+Mono
* **Powerline fonts:** https://github.com/powerline/fonts 

TODO: Write install.sh to run all of the above commands
