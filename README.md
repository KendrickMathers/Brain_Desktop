# Brain Desktop

> ⚠️ Brain Desktop is a complete Hyprland environment configuration.  
> It is not a standalone desktop environment.
>
> Designed for Arch Linux based systems such as CachyOS.  
> You need an existing Hyprland + Wayland setup before installation.

A complete Hyprland desktop configuration featuring a customized Wayland environment with Brain Shell integration, system tools, and personal desktop workflow.

---

# Preview

![Brain Desktop Screenshot](screenshots/desktop.png)

---

# Features

## Desktop Environment

- Hyprland configuration
- Brain Shell integration
- Custom Wayland workflow
- Automated configuration deployment
- Personal desktop environment setup

## Applications & Tools

- Brain Shell
- Fastfetch customization
- Ghostty terminal configuration
- Hyprland utilities
- Systemd user services

## Installer System

- Automatic configuration deployment
- Existing configuration backup
- Compatibility checks
- Easy installation
- Uninstaller support

---

# Installation

## Automatic Installation

Clone the repository:

```bash
git clone https://github.com/KendrickMathers/Brain_Desktop.git
```

Enter directory:

```bash
cd Brain_Desktop
```

Run installer:

```bash
chmod +x install.sh
./install.sh
```

After installation, restart Hyprland.

---

# Requirements

## Supported Systems

Currently tested on:

- CachyOS
- Arch Linux

Other Arch-based distributions may work but are not officially tested.

---

## Required Components

Before installation, make sure you have:

- Hyprland
- Wayland session
- Quickshell
- PipeWire
- NetworkManager
- Nerd Fonts

---

# What The Installer Does

The installer will:

- Check system compatibility
- Verify Hyprland installation
- Backup existing configurations
- Deploy Brain Desktop configurations
- Install Hyprland configuration
- Install Brain Shell configuration
- Install Fastfetch configuration
- Install Ghostty configuration
- Enable systemd user services

---

# Backup System

Before modifying your configuration, Brain Desktop creates a backup.

Example:

```text
~/.config.backup-Brain_Desktop-TIMESTAMP
```

Your previous configuration can be restored manually if needed.

---

# Configuration Structure

```
Brain_Desktop/

├── configs/
│
├── scripts/
│
├── wallpapers/
│
├── assets/
│
├── install.sh
│
├── uninstall.sh
│
└── README.md
```

Installed configuration:

```
~/.config/

├── hypr/
├── Brain_Shell/
├── fastfetch/
├── ghostty/
└── systemd/user/
```

---

# Brain Shell Integration

Brain Desktop uses **Brain Shell** as the main desktop shell.

Brain Shell provides:

- Custom dashboard
- Widgets
- System controls
- Notifications
- Wallpaper management
- Keybind integration

Original project:

https://github.com/Brainitech/Brain_Shell

---

# Uninstall

To remove Brain Desktop:

```bash
./uninstall.sh
```

The uninstall script removes installed configurations and disables Brain Desktop services.

Your backup configuration can be restored manually from:

```text
~/.config.backup-Brain_Desktop-TIMESTAMP
```

---

# Keybinds

Brain Desktop includes custom Hyprland keybind integration.

Main configuration:

```text
~/.config/Brain_Shell/
```

You can modify keybinds according to your preference.

---

# Known Issues

## Compatibility

- Brain Desktop is primarily tested on CachyOS and Arch Linux with Hyprland.
- Other Arch-based distributions may require additional adjustments.

## Hardware

- NVIDIA users may need additional driver configuration depending on their setup.
- Multi-monitor setups may require manual Hyprland workspace configuration.

## Installation

- Existing Hyprland configurations are backed up before installation.
- Custom configurations may require manual merging.
- Some optional applications may require manual installation if missing.

## Brain Shell

- Brain Shell requires a working Quickshell installation.
- Custom keybinds may conflict with existing Hyprland bindings.

## Wallpapers

- Video wallpapers depend on installed wallpaper backend and dependencies.
- Wallpaper paths may need adjustment for custom locations.

---

# Development

Main repository:

https://github.com/KendrickMathers/Brain_Desktop

Development workflow:

```bash
git checkout -b feature/my-feature

git commit -m "Add feature"

git push
```

Pull requests are welcome.

---

# Credits

Brain Desktop is built on top of **Brain Shell**, a Quickshell/QML desktop shell for Hyprland.

Original Brain Shell project:

https://github.com/Brainitech/Brain_Shell

Created by:

```text
Venkat Saahit Kamu (Brainitech)
```

Brain Desktop adds:

- Hyprland desktop configuration
- Automated installation workflow
- Backup and restore system
- CachyOS / Arch Linux integration
- Fastfetch configuration
- Ghostty configuration
- Additional desktop customization

Maintained by:

```text
KendrickMathers
```

Special thanks to:

- Hyprland community
- Quickshell contributors
- Linux ricing community

---

# License

Brain Desktop is licensed under the MIT License.

See:

```text
LICENSE
```

for full license information.

---

# Version

Current release:

```text
v0.1.0
```
