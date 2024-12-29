# Dotfiles

## Checkout
Put the following line in your `.bashrc` or `.zshrc`

```bash
# .bashrc
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' >> ~/.bashrc

# .zshrc
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> ~/.zshrc
```

and source it so the changes are applied to your current shell. Alternatively
you can also just close the current and open a new terminal.

```bash
source ~/.zshrc
```

## Setup Touchpad
Create or modify the file `/etc/X11/xorg.conf.d/30-touchpad.conf`

```
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lmr"
EndSection
```
