# inspired by https://github.com/linhmtran168/mac_dotfiles
# Important Links:
# http://www.catonmat.net/blog/bash-vi-editing-mode-cheat-sheet/ 

if [ "$(uname)" == "Darwin" ]; then
    # install brew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # install packages
    brew install zsh python python3 tmux wget brew-cask wget vim go
    brew link wget

    # install importnt gui apps
    brew cask install google-chrome iterm2 vlc google-drive alfred flux atom bettertouchtool macvim spotify docker spectacle messenger transmission

    # iterm solarized dark to desktop
    wget https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors ~/Desktop

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # apt-get
    sudo apt-get install -y zsh python3 tmux curl vim go 

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

# install fonts
git clone https://github.com/powerline/fonts && ./fonts/install.sh && rm -rf fonts

# install vim, remember to run :PlugInstall
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Symlink all dotfiles to home directories
ln config/.* ~

# vim setup
vim +PlugInstall +qall
vim +GoInstallBinaries +qall

