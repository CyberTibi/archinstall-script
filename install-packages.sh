#!/bin/bash
# install-packages.sh
# Telepít csomagokat egy packages.txt fájlból pacman/yay segítségével
# A fájl soronként tartalmazza a csomagneveket, '#' jelű sorok kommentek.

LIST="packages.txt"

if [[ ! -f "$LIST" ]]; then
    echo "Error: $LIST not found!"
    exit 1
fi

# Soronként olvasás
while read -r pkg; do
    # Üres sor vagy komment átugrása
    [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

    # Telepítés yay-jal (kezeli AUR-t és hivatalos repót is)
    echo ">>> Install: $pkg"
    yay -S --needed --noconfirm "$pkg"
done < "$LIST"
