> ⚠️ Important:
>
> Brain Desktop is a complete Hyprland environment configuration.
> It is not a standalone desktop environment.
>
> You need an existing Hyprland + Wayland setup before installation.


# Brain Desktop
## Preview

![Brain Desktop](screenshots/desktop.png)

My personal Hyprland desktop environment.

## Features

- Hyprland
- Brain Shell
- Fastfetch
- Ghostty
- Custom configuration
- Automated installer


## Installation

```bash
git clone https://github.com/KendrickMathers/Brain_Desktop.git

cd Brain_Desktop

chmod +x install.sh

./install.sh

# Requirements

## Supported Systems

Brain Desktop is designed for:

- Arch Linux
- CachyOS
- EndeavourOS
- Garuda Linux

Other Arch-based distributions may work but are not officially tested.

---

## Required Desktop Environment

Before installing, make sure you have:

- Hyprland
- Wayland session
- Quickshell

---

## Required Packages

The configuration uses:

### Core

- Hyprland
- Quickshell
- Qt6
- PipeWire
- WirePlumber
- NetworkManager
- BlueZ Bluetooth

### Utilities

- fastfetch
- ghostty
- brightnessctl
- playerctl
- wl-clipboard
- cliphist
- cava
- imagemagick

### Optional

- NVIDIA drivers (for NVIDIA users)
- Matugen (for dynamic colors)
- Nerd Fonts

---

## Installation

```bash
git clone https://github.com/KendrickMathers/Brain_Desktop.git

cd Brain_Desktop

chmod +x install.sh

./install.sh

# Known Issues

## Compatibility

- Brain Desktop is primarily tested on CachyOS and Arch Linux with Hyprland.
- Other Arch-based distributions may work but may require additional adjustments.

## Hardware

- NVIDIA users may need additional driver configuration depending on their hardware and driver setup.
- Multi-monitor setups may require manual Hyprland workspace and monitor configuration.

## Installation

- Existing Hyprland configurations are backed up before installation, but custom configurations may require manual merging.
- Some optional applications (such as Ghostty or Fastfetch assets) may need to be installed separately if they are not available on the system.

## Brain Shell

- Brain Shell requires a working Quickshell installation.
- Custom keybinds may conflict with existing Hyprland bindings.

## Wallpapers

- Video wallpapers depend on the configured wallpaper backend and required dependencies.
- Wallpaper paths may need adjustment if users use custom wallpaper locations.
