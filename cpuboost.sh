#!/system/bin/sh

# --- DEFINISI WARNA ---
R='\033[0;31m' # Merah
G='\033[0;32m' # Hijau
Y='\033[1;33m' # Kuning
B='\033[0;34m' # Biru
P='\033[0;35m' # Ungu
C='\033[0;36m' # Cyan
NC='\033[0m'   # No Color

# --- FUNGSI LOADING BAR ---
# Kita pake flag --progress-bar bawaan curl biar simpel tapi keren
download_logic() {
    local NAME=$
    local LINK=$https://files.itsnomercy.my.id/f/048d2a6a-58e7-4bef-a331-0557a0e4c6c6
     local FILE="/sdcard/Download/$NAME.apk"
     echo "${C}[*] Downloading: ${Y}$NAME${NC}"
    # Flag -# di curl buat nampilin progress bar [#####---]
    curl -Lk "$LINK" -o "$FILE" -# 

    if [ -s "$FILE" ]; then
        echo "${G}[+] Download Complete! Size: $(ls -lh "$FILE" | awk '{print $5}')${NC}"
        echo "${P}[-] Installing (Root Required)...${NC}"
        su -c "pm install -r -g $FILE" && rm "$FILE"
        echo "${G}[!] $NAME INSTALLED SUCCESSFULLY!${NC}"
    else
        echo "${R}[X] ERROR: File 2 Bytes detected or Link Dead!${NC}"
    fi
    echo "${B}------------------------------------${NC}"
}

# --- MENU UTAMA ---
while true; do
    clear
    # ASCII ART BERWARNA (SAUL)
    echo "${C}  ____       _   _ _     ${NC}"
    echo "${C} / ___| __ _| | | | |    ${NC}"
    echo "${C} \___ \/ _\` | | | | |    ${NC}"
    echo "${C}  ___) | (_| | |_| | |___ ${NC}"
    echo "${C} |____/ \__,_|\___/|_____|${NC}"
    echo "${P}      [ PREMIUM ENGINE ]${NC}"
    echo "${B}====================================${NC}"
    echo "${Y}1.${NC} CPU-Z Booster (Original)"
    echo "${Y}2.${NC} Downloader NoMercy (128MB)"
    echo "${Y}3.${NC} Gofile Worker Proxy"
    echo "${R}x.${NC} Exit Program"
    echo "${B}------------------------------------${NC}"
    printf "${G}[?] Pilih nomor (misal 1 2): ${NC}"
    read PILIH

    case $PILIH in
        x|X) echo "${R}Bubay Saul! Program Closed.${NC}"; break ;;
        *)
            for item in $PILIH; do
                if [ "$item" = "1" ]; then
                    download_logic "CPU_Z" "https://raw.githubusercontent.com/gajelasfefek-afk/Cpuchecker/main/Cpubooster.apk"
                elif [ "$item" = "2" ]; then
                    download_logic "NoMercy" "https://files.itsnomercy.my.id/f/048d2a6a-58e7-4bef-a331-0557a0e4c6c6"
                elif [ "$item" = "3" ]; then
                    download_logic "Worker_Proxy" "https://gofile-clone.mrcy-25d.workers.dev/api/download/test" # Contoh link
                else
                    echo "${R}[!] Opsi $item kaga ada, Cuk!${NC}"
                fi
            done
            echo "\n${Y}[!] Selesai. Tekan ENTER balik ke menu...${NC}"
            read junk
            ;;
    esac
done
    echo "[X] ERROR: File Kosong! Cek link atau koneksi."
fi

echo "------------------------------------"
