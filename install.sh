#!/bin/sh

# install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

brew install wget
brew install mc
brew install node
brew install mongo
brew install git
brew install findutils


# install powerline fonts
mkdir ~/tmp && cd ~/tmp
git clone https://github.com/powerline/fonts.git
cd fonts
sh -c ./install.sh
cd ~/tmp && rm -rf ./fonts

# install nerd fonts
brew tap caskroom/fonts
brew cask install font-hack-nerd-font


# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set zsh as default shell
chsh -s /bin/zsh

# Oh-my-zsh theme and config
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp ./.zshrc ~/.zshrc

#git settings
git config --global user.name "Sinegovsky Ivan"
git config --global user.email "ivan@sinegovsky.ru"
git config --global credential.helper osxkeychain

# Install all available updates
sudo softwareupdate -iva

# Install Xcode command line tools
xcode-select --install

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
