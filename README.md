## Setup

    # Set zsh to default shell
    chsh -s $(which zsh)

    # Install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

    # Symlink dot files
    ln -s ~/dotfiles/default.zshrc ~/.zshrc
    ln -s ~/dotfiles/default.vimrc ~/.vimrc
    ln -s ~/dotfiles/default.gitconfig ~/.gitconfig
    ln -s ~/dotfiles/default.gitignore_global ~/.gitignore_global

    # Download Vundle to ~/.vim
    mkdir ~/.vim
    mkdir ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # Run Vundle to install vim plugins
    vim +PluginInstall +qall

## Font files

* **Roboto Mono:** https://fonts.google.com/specimen/Roboto+Mono?selection.family=Roboto+Mono
* **Powerline fonts:** https://github.com/powerline/fonts 

**NOTE:** Sometimes I use Monaco

TODO: Write install.sh to run all of the above commands
