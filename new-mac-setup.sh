#!/usr/bin/env bash
set +ex

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  ARCHITECTURE=$(uname -m) # Gets system architecture
  if [[ $ARCHITECTURE == arm* ]]; then
    # Fixes brew issue with Rosetta 2 in ARM (Mac M1)
     echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/farisaziz/.zprofile
     eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  # Install Basic Dev Apps
  brew install --cask 1password
  brew install --cask google-chrome
  brew install --cask postman
  brew install --cask sequel-pro
  brew install --cask zoom
  brew install --cask visual-studio-code
  brew install --cask notion
  brew install --cask spotify
  brew install --cask github
  brew install --cask slack
  brew install --cask raycast
  brew install --cask iterm2
  echo Apps installed

  # Install Essential Packages
brew install curl, args: ["with-nghttp2"]
brew install git
brew install node
brew install ruby
brew install tree
brew install wget
brew install zsh
brew install zsh-completions
brew tap "homebrew/cask"


# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh My Zsh installed"
# setup Powerlevel10k theme
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
echo "Powerlevel10k theme setup"


npm install --global yarn
# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
compaudit | xargs chmod g-w

echo Essential packages installed

osascript -e 'tell app "Terminal"
    do script "nvm install 14 && nvm use 14"
end tell'


  # Install X-code command line tools if not installed

  if xcode-select --install 2>&1 | grep installed; then
    echo command-line-tools installed;
  else
    echo command-line-tools not installed, installing;
    xcode-select --install
  fi

  # Setup git aliases. Don't forget to change [user] Name and Email in .gitconfig
  echo 'Please input your full name:'
  read -r NAME
  echo 'Please input your github email:'
  read -r EMAIL
  touch ~/.gitconfig
  head -n 41 ./gitconfig.txt > ~/.gitconfig
  echo "  name = $NAME" >> ~/.gitconfig
  echo "  email = $EMAIL" >> ~/.gitconfig
  tail -n +44 ./gitconfig.txt >> ~/.gitconfig
  echo Git config setup

  echo 'Here are your main git aliases'

  echo 'st = status'
  echo 'ci = commit'
  echo 'br = branch'
  echo 'co = checkout'
  echo 'df = diff'
  echo 'lg = log -p'
  echo 'who = shortlog -s --'
  echo 'up = pull'
  echo 'pr = pull --rebase'
  echo 'pu = !"git fetch origin -v; git fetch upstream -v; git merge upstream/master"'


echo Setup Complete
