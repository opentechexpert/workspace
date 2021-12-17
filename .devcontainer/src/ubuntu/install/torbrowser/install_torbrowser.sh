#!/usr/bin/env bash
set -xe
echo "Install TorBrowser"

apt-get install -y xz-utils curl
TOR_HOME=$HOME/tor-browser/
mkdir -p $TOR_HOME
TOR_URL=$(curl -q https://www.torproject.org/download/ | grep downloadLink | grep linux64 | sed 's/.*href="//g'  | cut -d '"' -f1 | head -1)
wget --quiet https://www.torproject.org/${TOR_URL} -O /tmp/torbrowser.tar.xz
tar -xJf /tmp/torbrowser.tar.xz -C $TOR_HOME
rm /tmp/torbrowser.tar.xz


cp $TOR_HOME/tor-browser_en-US/start-tor-browser.desktop $TOR_HOME/tor-browser_en-US/start-tor-browser.desktop.bak
cp $TOR_HOME/tor-browser_en-US/Browser/browser/chrome/icons/default/default128.png /usr/share/icons/tor.png
chown 1000:0 /usr/share/icons/tor.png
sed -i 's/^Name=.*/Name=Tor Browser/g' $TOR_HOME/tor-browser_en-US/start-tor-browser.desktop
sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/tor.png/g' $TOR_HOME/tor-browser_en-US/start-tor-browser.desktop
sed -i 's/Exec=.*/Exec=sh -c \x27"$HOME\/tor-browser\/tor-browser_en-US\/Browser\/start-tor-browser" --detach || ([ !  -x "$HOME\/tor-browser\/tor-browser_en-US\/Browser\/start-tor-browser" ] \&\& "$(dirname "$*")"\/Browser\/start-tor-browser --detach)\x27 dummy %k/g'  $TOR_HOME/tor-browser_en-US/start-tor-browser.desktop


cat >> $TOR_HOME/tor-browser_en-US/Browser/TorBrowser/Data/Browser/profile.default/prefs.js <<EOL
user_pref("extensions.torlauncher.prompt_at_startup", false);
user_pref("extensions.torlauncher.quickstart", true);
user_pref("browser.download.lastDir", "/home/kasm-user/Downloads");
EOL

# Maintain backwards compatability with old image definitions that expect tor to be launched from /tmp
mkdir -p /tmp/tor-browser_en-US/Browser/
ln -s $TOR_HOME/tor-browser_en-US/start-tor-browser.desktop /tmp/tor-browser_en-US/Browser/start-tor-browser.desktop 

chown -R 1000:0 $TOR_HOME/


cp $TOR_HOME/tor-browser_en-US/start-tor-browser.desktop $HOME/Desktop/
chown 1000:0  $HOME/Desktop/start-tor-browser.desktop
