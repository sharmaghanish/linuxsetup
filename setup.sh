# Get Package Manager
APT_GET_CMD=$(which apt-get)
PACMAN_GET_CMD = $(which pacman)

# configure packages
if [[ ! -z $APT_GET_CMD ]]; then
sudo apt update && sudo apt upgrade && sudo apt-get install \
adb autoconf automake axel bc bison build-essential ccache clang cmake curl \
expat flex g++ g++-multilib gawk gcc gcc-multilib git git-core git-lfs \
gnupg gperf htop imagemagick kmod lib32ncurses5-dev lib32readline-dev \
lib32z1-dev libc6-dev libcap-dev libexpat1-dev libgmp-dev liblz4-* liblz4-tool \
liblzma* libmpc-dev libmpfr-dev libncurses5-dev libsdl1.2-dev libssl-dev \
libtinfo5 libtool libwxgtk3.0-dev libxml-simple-perl libxml2 libxml2-utils \
lzip lzma* lzop maven ncftp ncurses-dev patch patchelf pkg-config pngcrush \
pngquant python python3 python-all-dev re2c rsync schedtool squashfs-tools subversion \
texinfo unzip w3m xsltproc zip zlib1g-dev zram-config
 elif [[ ! -z $PACMAN_GET_CMD ]]; then
  sudo pacman -Sy android-tools openjdk6 perl git gnupg flex bison gperf zip unzip sdl wxgtk squashfs-tools ncurses libpng zlib libusb libusb-compat readline
else echo "Error! Cannot Setup scripts distro not supported or cant find pacman or apt"

# configure repo to sync android
mkdir ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo-1 > ~/bin/repo
chmod a+x ~/bin/repo

# Update/Install stuffs that i use
if [[ ! -z $APT_GET_CMD ]]; then
sudo apt update && sudo apt upgrade && sudo apt-get firefox keepassxc python-pip

#install brave and librewolf
sudo apt install apt-transport-https curl 

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list

sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg


sudo apt update

sudo apt install brave-browser
elif [[ ! -z $PACMAN_GET_CMD ]]; then
  sudo pacman -Sy firefox keepassxc python-pip yay nano && yay -S brave-bin && pacman -S librewolf-bin
else echo "Error! Cannot Setup scripts distro not supported or cant find pacman or apt"

# configure whoogle
# about whoogle - whoogle is a self hosted privacy respecting metasearchengine get google results without any form of tracking

# git clone https://github.com/benbusby/whoogle-search.git
# cd whoogle-search
# source venv/bin/activate
# pip install -r requirements.txt
# ./run
# sudo nano /lib/systemd/system/whoogle.service
# [Unit]
# Description=Whoogle

# [Service]
# Basic auth configuration, uncomment to enable
#Environment=WHOOGLE_USER=<username>
#Environment=WHOOGLE_PASS=<password>
# Proxy configuration, uncomment to enable
#Environment=WHOOGLE_PROXY_USER=<proxy username>
#Environment=WHOOGLE_PROXY_PASS=<proxy password>
#Environment=WHOOGLE_PROXY_TYPE=<proxy type (http|https|proxy4|proxy5)
#Environment=WHOOGLE_PROXY_LOC=<proxy host/ip>
# Site alternative configurations, uncomment to enable
# Note: If not set, the feature will still be available
# with default values.
#Environment=WHOOGLE_ALT_TW=farside.link/nitter
#Environment=WHOOGLE_ALT_YT=farside.link/invidious
#Environment=WHOOGLE_ALT_IG=farside.link/bibliogram/u
#Environment=WHOOGLE_ALT_RD=farside.link/libreddit
#Environment=WHOOGLE_ALT_MD=farside.link/scribe
#Environment=WHOOGLE_ALT_TL=farside.link/lingva
#Environment=WHOOGLE_ALT_IMG=farside.link/rimgo
#Environment=WHOOGLE_ALT_WIKI=farside.link/wikiless
# Load values from dotenv only
#Environment=WHOOGLE_DOTENV=1
# Type=simple
# User=<username>
# If installed as a package, add:
# ExecStart=<python_install_dir>/python3 <whoogle_install_dir>/whoogle-search --host 127.0.0.1 --port 5000
# For example:
# ExecStart=/usr/bin/python3 /home/my_username/.local/bin/whoogle-search --host 127.0.0.1 --port 5000
# Otherwise if running the app from source, add:
# ExecStart=<whoogle_repo_dir>/run
# For example:
# ExecStart=/var/www/whoogle-search/run
# ExecReload=/bin/kill -HUP $MAINPID
# Restart=always
# RestartSec=3
# SyslogIdentifier=whoogle

# [Install]
# WantedBy=multi-user.target

sudo systemctl daemon-reload
sudo systemctl enable whoogle
sudo systemctl start whoogle

# Configuring Git
echo "enter git name:"
read gitname
echo "enter git email:"
read gitemail
git config user.name "$gitname"
git config user.email "$gitemail"

#install gdrive cli
go get github.com/prasmussen/gdrive