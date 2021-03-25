cd
git clone https://github.com/denysdovhan/spaceship-prompt.git --depth=1
ln -sf "$PWD/spaceship.zsh" "${ZDOTDIR:-$HOME}/.zfunctions/prompt_spaceship_setup"
touch ~/.zshrc
echo autoload -U promptinit; promptinit >> ~/.zshrc
echo prompt spaceship