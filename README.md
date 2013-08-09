These are my default dotfiles for setting up a new system.

Run these commands on initial setup:

    # Set zsh to default shell
    sudo chsh -s /bin/zsh

    # Install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

    # Update all the submodules
    git submodule foreach git pull

    cp default.zshrc .zshrc
    cp default.vimrc .vimrc

TODO: Write script to copy and symlink files
