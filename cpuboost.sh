CYAN='\033[0;36m'
HIJAU='\033[0;32m'
PUTIH='\033[0m'

# --- BANNER GELO ---
clear
echo -e "${CYAN}"
echo "  ____  _     _                 ____       _   "
echo " |  _ \(_)_ _| |__   __ _  ___ | __ )  ___| |_ "
echo " | |_) | | '_ \ '_ \ / _' |/ _ \|  _ \ / _ \ __|"
echo " |  _ <| | |_) | | | | (_| | (_) | |_) | (_) | |_ "
echo " |_| \_\_| .__/|_| |_|\__,_|\___/|____/ \___/ \__|"
echo "         |_|                                       "
echo -e "          [ Created by: Dragngentod ]"
echo -e "${PUTIH}"

echo -e "${HIJAU}[*] Memulai proses instalasi...${PUTIH}"

# Link Catbox lu yang tadi
LINK_APK="https://files.catbox.moe/9c3avs.apk"

# Proses Download
wget -q --show-progress $LINK_APK -O bot_roblox.apk

# Proses Install
if [ -f "bot_roblox.apk" ]; then
    echo -e "${HIJAU}[+] Download selesai! Menginstal...${PUTIH}"
    pm install -r bot_roblox.apk
    rm bot_roblox.apk
    echo -e "${HIJAU}[!] BERHASIL! Selamat nge-bot, Cuk.${PUTIH}"
else
    echo -e "${MERAH}[X] Gagal download!${PUTIH}"
