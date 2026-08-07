# Brain Shell

A modular Quickshell/QML desktop shell for Hyprland.

Brain Shell provides a modern Wayland desktop experience with customizable panels, dashboards, widgets, system controls, and automation tools.

This repository is a customized fork focused on:

- CachyOS / Arch Linux support
- Automated desktop configuration deployment
- Hyprland environment setup
- Backup and restore workflow
- Easy installation
- Personal Hyprland rice deployment

---

# Screenshots

Screenshots will be added soon.

---

# Installation

## Automatic Installation

Run:

```bash
curl -fsSL https://raw.githubusercontent.com/KendrickMathers/Brain_Shell/refs/heads/brain-desktop/install.sh | bash
```

The installer will:

- Check system compatibility
- Verify dependencies
- Backup existing configurations
- Install required packages
- Deploy Brain Shell configuration
- Install Hyprland configuration
- Enable systemd user services
- Initialize wallpaper directories

After installation, restart Hyprland.

---

# Manual Installation

Clone the repository:

```bash
git clone https://github.com/KendrickMathers/Brain_Shell.git
```

Enter directory:

```bash
cd Brain_Shell
```

Run installer:

```bash
chmod +x install.sh
./install.sh
```

---

# Supported Systems

Currently supported:

- Arch Linux
- CachyOS
- EndeavourOS
- Garuda Linux

Other Arch-based distributions may work but are not officially tested.

---

# Requirements

## Desktop Environment

- Hyprland
- Wayland session
- Quickshell

## System Components

- Qt6
- PipeWire
- WirePlumber
- NetworkManager
- BlueZ Bluetooth stack

## Utilities

- brightnessctl
- playerctl
- mpv-mpris
- cava
- wf-recorder
- slurp
- wl-clipboard
- imagemagick
- wtype

---

# Features

## Desktop Shell

- Modern QML interface
- Customizable panels
- Dashboard system
- Popup system
- Modular architecture

## System Controls

- Audio control
- Network management
- Bluetooth management
- Notification center
- Clipboard manager
- Power menu
- System information

## Wallpaper System

- Image wallpaper support
- Video wallpaper support
- Wallpaper restore system
- Wallpaper directory management

## Customization

- Dynamic colors
- Configurable keybinds
- Hyprland integration
- User configuration deployment

---

# Configuration System

Brain Shell includes a configuration deployment system.

Structure:

```text
configs/
├── hypr/
│   └── hyprland.lua
│
├── Brain_Shell/
│   ├── Brain_ShellKeybinds.lua
│   ├── Brain_ShellKeybinds.conf
│   └── colors.conf
│
└── systemd/
    └── brainshell.service
```

The installer deploys:

```text
~/.config/
├── hypr/
├── Brain_Shell/
└── systemd/user/
```

---

# Backup System

Before modifying existing configurations, Brain Shell creates a backup:

```text
~/.config.backup-TIMESTAMP-Brain_Shell/
```

This allows restoring the previous Hyprland configuration if needed.

---

# Installer Workflow

```text
install.sh
    |
    v
Dependency Check
    |
    v
System Detection
    |
    v
Backup Existing Config
    |
    v
Clone Repository
    |
    v
Install Packages
    |
    v
Deploy Configuration
    |
    v
Enable Services
```

---

# Project Structure

```text
Brain_Shell/
├── configs/
├── dots-extra/
├── installer/
├── scripts/
├── src/
├── install.sh
├── shell.qml
└── README.md
```

---

# Development

Development branch:

```text
brain-desktop
```

This branch contains:

- Installer improvements
- Configuration deployment
- Desktop integration
- Experimental features

Stable releases will be merged into:

```text
main
```

---

# Keybinds

Default keybinds can be configured through:

```text
~/.config/Brain_Shell/
```

Configuration files:

```text
Brain_ShellKeybinds.lua
Brain_ShellKeybinds.conf
```

---

# Contributing

Contributions are welcome.

Before submitting changes:

```bash
git checkout -b feature/my-feature
git commit -m "Add feature"
git push
```

Then open a pull request.

---

# Credits

Originally created by:

```text
Venkat Saahit Kamu (Brainitech)
```

This fork contains additional modifications:

- Brain Desktop installer workflow
- Arch/CachyOS configuration deployment
- Backup and restore system
- Additional desktop integration

Modifications by:

```text
KendrickMathers
```

---

# License

Brain Shell is licensed under the MIT License.

See:

```text
LICENSE
```

for full license information.
