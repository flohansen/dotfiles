#!/usr/bin/env bash
set -e

info() { echo -e "\033[1;34m==> $1\033[0m"; }

config() { /usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME" "$@"; }

setup_oh_my_zsh() {
    OMZ_DIR="$HOME/.oh-my-zsh"

    if [ -d "$OMZ_DIR" ]; then
        info "Oh My Zsh already installed, skipping..."
        return
    fi

    info "Setting up Oh My Zsh..."

    OMZ_CUSTOM="$OMZ_DIR/custom"

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    if [ ! -f "$OMZ_CUSTOM/themes/catppuccin.zsh-theme" ]; then
        git clone --depth=1 https://github.com/JannoTjarks/catppuccin-zsh.git /tmp/catppuccin-zsh
        cp -r /tmp/catppuccin-zsh/catppuccin-flavors "$OMZ_CUSTOM/themes/"
        cp /tmp/catppuccin-zsh/catppuccin.zsh-theme "$OMZ_CUSTOM/themes/"
        rm -rf /tmp/catppuccin-zsh
    fi

    if [ ! -d "$OMZ_CUSTOM/plugins/zsh-autosuggestions" ]; then
        git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$OMZ_CUSTOM/plugins/zsh-autosuggestions"
    fi

    if [ ! -d "$OMZ_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$OMZ_CUSTOM/plugins/zsh-syntax-highlighting"
    fi

    if ! command -v fzf &> /dev/null; then
        info "fzf not found. Install it manually or via your package manager."
    fi

    if [ ! -f "$HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh" ]; then
        mkdir -p "$HOME/.zsh"
        curl -fsSL https://raw.githubusercontent.com/catppuccin/zsh-syntax-highlighting/main/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh -o "$HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh"
    fi
}

install_yay() {
    if command -v yay &> /dev/null; then
        info "yay already installed, skipping..."
        return
    fi

    info "Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -s --noconfirm && sudo pacman -U --noconfirm *.pkg.tar.zst)
}

install_packages() {
    info "Installing packages..."
    yay -S --noconfirm direnv neovim uwsm greetd greetd-tuigreet wayland waybar wl-clipboard hyprland hyprpaper hyprpolkitagent rofi-wayland mako pipewire pipewire-pulse wireplumber alacritty ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji pavucontrol xdg-desktop-portal-hyprland grim slurp thunar btop openvpn keepassxc nix lazygit docker docker-buildx zsh-autosuggestions zsh-syntax-highlighting brave-bin
}

setup_dotfiles() {
    info "Syncing dotfiles..."

    if [ -d "$HOME/.cfg" ]; then
        info "Dotfiles repo already exists, skipping..."
        return
    fi

    git clone --bare https://github.com/flohansen/dotfiles "$HOME/.cfg"
    git config --global --add safe.directory '*'

    config checkout
    config config --local status.showUntrackedFiles no
}

setup_oh_my_zsh
install_yay
install_packages
setup_dotfiles
info "Done!"
