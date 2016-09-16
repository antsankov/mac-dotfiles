# inspired by https://github.com/linhmtran168/mac_dotfiles

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install packages
brew install zsh python python3 tmux wget brew-cask wget vim
brew link wget

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh


# install importnt gui apps
brew cask install google-chrome iterm2 vlc google-drive alfred flux atom bettertouchtool

# iterm solarized dark
wget https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors

# install fonts
git clone https://github.com/powerline/fonts && ./fonts/install.sh && rm -rf fonts

# install vim
git clone https://github.com/ddellaquila/dd-vim.giti && cd dd-vim && ./install.sh

# Symlink all dotfiles to home directories
ln config/.* ~
