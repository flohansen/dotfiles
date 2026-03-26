# Dotfiles

My Arch Linux + Hyprland dotfiles with Oh My Zsh configuration.

## Bootstrap a new machine

```bash
curl -fsSL https://raw.githubusercontent.com/flohansen/dotfiles/main/scripts/install.sh | bash
```

This will:
1. Install Oh My Zsh with catppuccin theme and plugins
2. Install yay (AUR helper)
3. Install all packages
4. Sync dotfiles from this repo to `~/.config`

## Managing dotfiles

After installation, use the `config` alias to manage your dotfiles:

```bash
config status          # See changes
config add <file>      # Track a file
config commit -m ""    # Commit changes
config push            # Push to remote
```

## Repository structure

```
dotfiles/
├── .config/           # Config files (wayland, neovim, etc.)
└── scripts/
    └── install.sh     # Installation script (curl-friendly)
```

## Manual installation

If you prefer to install step by step:

```bash
# 1. Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 2. Install packages
yay -S direnv fzf neovim greetd greetd-tuigreet wayland waybar wl-clipboard \
  hyprland hyprpaper hyprpolkitagent rofi-wayland mako pipewire pipewire-pulse \
  wireplumber alacritty ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji \
  pavucontrol xdg-desktop-portal-hyprland grim slurp thunar btop openvpn keepassxc \
  nix lazygit docker docker-buildx zsh-autosuggestions zsh-syntax-highlighting brave-bin

# 3. Sync dotfiles
git clone --bare https://github.com/flohansen/dotfiles ~/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
```

## Components

- **Shell**: Zsh with Oh My Zsh
- **Theme**: Catppuccin Mocha
- **Plugins**: git, fzf, zsh-autosuggestions, zsh-syntax-highlighting
- **WM**: Hyprland
- **Bar**: Waybar
- **Launcher**: Rofi
- **Terminal**: Alacritty
- **Editor**: Neovim
