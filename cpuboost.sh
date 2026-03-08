#!/bin/sh

# Banner DRAG
echo "  ____   ____        _     ____ "
echo " |  _ \ |  _ \      / \   / ___|"
echo " | | | || |_) |    / _ \ | |  _ "
echo " | |_| ||  _ <    / ___ \| |_| |"
echo " |____/ |_| \_\  /_/   \_\\____|"
echo "      [ DEVELOPED BY DRAG ]"
echo "------------------------------------"

# LINK SAKTI LU TADI
LINK="https://raw.githubusercontent.com/gajelasfefek-afk/Cpuchecker/refs/heads/main/bot.apk"
FILE="bot.apk"

echo "[*] Menyedot APK dari GitHub..."
# Tambahin flag -L biar kalo GitHub nge-redirect tetep dapet
curl -L "$LINK" -o "$FILE"

if [ -f "$FILE" ]; then
    echo "[+] Download Berhasil!"
    echo "[-] Memasang APK ke Cloud Phone..."
    pm install -r "$FILE"
    
    if [ $? -eq 0 ]; then
        echo "[!] INSTALL SUCCESS! APK SIAP TEMPUR."
        rm "$FILE"
    else
        echo "[X] INSTALL GAGAL! (Coba ketik 'su' dulu di terminal)"
    fi
else
    echo "[X] DOWNLOAD GAGAL! Link-nya mungkin typo, Cuk."
fi

echo "------------------------------------"
