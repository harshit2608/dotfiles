# !/bin/bash

# Install xCode cli tools
if [[ "$(uname)" == "Darwin" ]]; then
    echo "macOS deteted..."

    if xcode-select -p &>/dev/null; then
        echo "Xcode already installed"
    else
        echo "Installing commandline tools..."
        xcode-select --install
    fi
fi

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Taps
echo "Tapping Brew..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae

# Formulae
echo "Installing Brew Formulae..."

# Core Utils
echo "Install gnu coreutils"
brew install coreutils

# Must Have things
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install stow
brew install fzf
brew install bat
brew install fd
brew install zoxide
brew install lua
brew install luajit
brew install luarocks
brew install prettier
brew install make
brew install ripgrep

# Terminal
brew install git
brew install lazygit
brew install tmux
brew install neovim
brew install starship
brew install tree-sitter
brew install tree
brew install borders
brew install yazi
brew install viddy
# dev things
brew install node sqlite nvm pyenv jenv
brew install zoxide exa kubectx kubernetes kube-ps1
brew install cassandra mongosh redis


brew install --cask nikitabobko/tap/aerospace
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask postman
brew install --cask visual-studio-code
brew install --cask cursor
brew install --cask rectangle
brew install --cask jetbrains-toolbox
# MacOS settings
echo "Changing macOS defaults..."
defaults write com.apple.Dock autohide -bool TRUE
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write InitialKeyRepeat -int 15

# csrutil status
echo "Installation complete..."

# Stow dotfiles packages
echo "Stowing dotfiles..."
stow -t ~ karabiner starship tmux sketchybar aerospace ghostty nvim 

# export gnu coreutils to path
echo 'export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"' >> ~/.zshrc


echo "Dotfiles setup complete!"
