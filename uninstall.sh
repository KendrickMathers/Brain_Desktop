#!/bin/bash

echo "================================="
echo " Brain Desktop Uninstaller"
echo "================================="

echo ""
echo "Removing Brain Desktop configs..."

rm -rf ~/.config/Brain_Shell
rm -rf ~/.config/fastfetch
rm -rf ~/.config/ghostty

systemctl --user disable brainshell.service 2>/dev/null || true
systemctl --user stop brainshell.service 2>/dev/null || true

echo ""
echo "Done."
echo "Restore your backup manually if needed."
