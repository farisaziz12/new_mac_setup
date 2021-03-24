
#!/usr/bin/env bash
set -ex

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Essential Packages
brew install curl, args: ["with-nghttp2"]
brew install git
brew install node
brew install nvm
brew install ruby
brew install tree
brew install wget
brew install zsh
brew install zsh-completions
brew tap "homebrew/cask"
echo Essential packages installed

# Install Basic Dev Apps
brew install --cask 1password
brew install --cask google-chrome
brew install --cask firefox-developer-edition
brew install --cask postman
brew install --cask sequel-pro
brew install --cask tower
brew install --cask transmit
brew install --cask zoomus
brew install --cask visual-studio-code
brew install --cask android-studio
brew install --cask notion
brew install --cask spotify
brew install --cask github
brew install --cask slack
echo Apps installed

# Install X-code command line tools if not installed

if xcode-select --install 2>&1 | grep installed; then
  echo command-line-tools installed;
else
  echo command-line-tools not installed, installing;
  xcode-select --install
fi

# Setup git aliases. Don't forget to change [user] Name and Email in .gitconfig
touch ~/.gitconfig
cp ./gitconfig.txt ~/.gitconfig
echo Git config setup


echo Setup Complete