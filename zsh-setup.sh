cd
git clone https://github.com/denysdovhan/spaceship-prompt.git --depth=1 ~/spaceship
ln -sf "$PWD/spaceship.zsh" "/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
touch ~/.zshrc
cp ./zsh.txt ~/.zshrc