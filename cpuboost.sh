#!/system/bin/sh

# --- BANNER SAUL ---
echo "  ____   ____        _     ____ "
echo " |  _ \ |  _ \      / \   / ___|"
echo " | | | || |_) |    / _ \ | |  _ "
echo " | |_| ||  _ <    / ___ \| |_| |"
echo " |____/ |_| \_\  /_/   \_\\____|"
echo "      [ MODE: GITHUBNGENTOD ]"
echo "------------------------------------"

# KONFIGURASI LINK RAW
LINK="https://raw.githubusercontent.com/gajelasfefek-afk/Cpuchecker/main/Cpubooster.apk"
FILE="/sdcard/Download/Cpubooster.apk"

echo "[*] Mendownload Cpubooster.apk..."
# Pakai -Lk biar kuat nembus koneksi
curl -Lk "$LINK" -o "$FILE"

if [ -s "$FILE" ]; then
    echo "[+] Download Selesai!"
    echo "[-] Mengeksekusi Instalasi (Root)..."
    
    # Izin penuh biar sistem bisa baca
    chmod 777 "$FILE"
    
    # Install paksa lewat Root
    su -c "pm install -r $FILE"
    
    if [ $? -eq 0 ]; then
        echo "[!] MANTAP SAUL! INSTALL SUCCESS."
        rm "$FILE"
    else
        echo "[X] GAGAL! Pastikan tombol ROOT di Cloud Phone ON!"
    fi
else
    echo "[X] ERROR: File Kosong! Cek link atau koneksi."
fi

echo "------------------------------------"
