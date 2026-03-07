#!/bin/sh

# Banner DRAG (Versi Standar)
echo " "
echo "  ____   ____        _     ____ "
echo " |  _ \ |  _ \      / \   / ___|"
echo " | | | || |_) |    / _ \ | |  _ "
echo " | |_| ||  _ <    / ___ \| |_| |"
echo " |____/ |_| \_\  /_/   \_\\____|"
echo "      [ DEVELOPED BY DRAGNGENTOD ]"
echo "------------------------------------"

# Link APK
LINK="https://files.catbox.moe/9c3avs.apk"
FILE="drag_bot.apk"

echo "[*] Downloading..."
# Pake curl atau wget (biar salah satu pasti jalan)
if command -v wget > /dev/null; then
    wget -q $LINK -O $FILE
else
    curl -L $LINK -o $FILE
fi

if [ -f "$FILE" ]; then
    echo "[+] Download Success!"
    echo "[-] Installing APK..."
    # Perintah install standar
    pm install -r $FILE
    
    if [ $? -eq 0 ]; then
        echo "[!] INSTALL SUCCESS!"
        rm $FILE
    else
        echo "[X] INSTALL FAILED!"
    fi
else
    echo "[X] DOWNLOAD FAILED!"
fi

echo "------------------------------------"
echo "Done!"
