# Display Manager
On KDE use sddm
On Gnome (Ubuntu 24.04): install i3 with "apt install i3 i3status dmenu". Default Display Manager works.

# GPU driver
2025-01-06: Only nvidia-dkms works

# alacritty terminal
* Install rust: curl https://sh.rustup.rs -sSf | sh
  * This will also install the "cargo" package manager
* In .bashrc setup it will automatically set up the environment: . "$HOME/.cargo/env"
* cargo install alacritty
* Enable alacritty as default terminal emulator:
  sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /home/tobias/.cargo/bin/alacritty 50
  sudo update-alternatives --list x-terminal-emulator
  sudo update-alternatives --set x-terminal-emulator /home/tobias/.cargo/bin/alacritty

# zsh
* Install zsh: sudo apt install zsh
* sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
* Update .zshrc from repo
