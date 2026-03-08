#!/bin/sh

# --- BANNER DRAG ---
echo " "
echo "  ____   ____        _     ____ "
echo " |  _ \ |  _ \      / \   / ___|"
echo " | | | || |_) |    / _ \ | |  _ "
echo " | |_| ||  _ <    / ___ \| |_| |"
echo " |____/ |_| \_\  /_/   \_\\____|"
echo "      [ DEVELOPED BY DRAGNGENTOD ]"
echo "------------------------------------"

# --- KONFIGURASI ---
# Link Raw dari Repo Baru Lu
LINK="https://raw.githubusercontent.com/gajelasfefek-afk/Cpuchecker/main/bot.apk"
FILE="drag_bot.apk"

echo "[*] Mencoba download dari Repo: Cpuchecker..."

# --- PROSES DOWNLOAD ---
# Pakai -L buat handle redirect GitHub
curl -L "$LINK" -o "$FILE"

# --- PROSES VALIDASI & INSTALL ---
if [ -f "$FILE" ]; then
    # Cek apakah file yang didownload beneran APK (bukan teks error 404)
    FILE_SIZE=$(wc -c <"$FILE")
    if [ "$FILE_SIZE" -gt 1000 ]; then
        echo "[+] Download Berhasil! (Ukuran: $FILE_SIZE bytes)"
        echo "[-] Memulai instalasi ke system..."
        
        # Eksekusi Instalasi
        pm install -r "$FILE"
        
        if [ $? -eq 0 ]; then
            echo "[!] STATUS: INSTALL SUCCESS! GASSKEUN!"
            rm "$FILE"
        else
            echo "[X] STATUS: INSTALL FAILED! (Coba ketik 'su' dulu di terminal)"
        fi
    else
        echo "[X] ERROR: File terlalu kecil. Link RAW mungkin salah/404!"
        rm "$FILE"
    fi
else
    echo "[X] ERROR: Gagal mendownload file dari GitHub."
fi

echo "------------------------------------"
echo "Done! Script by DRAG."
