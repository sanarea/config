#!/usr/bin/env bash
echo

apt_update() {
    sudo apt update
    sudo apt upgrade -y
    
}

pm2_install(){
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
    source ~/.bashrc
    nvm install --lts
    npm i -g pm2
    pm2 set pm2-logrotate:max_size 100M 
    pm2 set pm2-logrotate:rotateInterval '0 1 * * *' 
    pm2 set pm2-logrotate:retain 10 
    pm2 install pm2-logrotate
}
tools_install(){
    sudo apt-get install vim git build-essential cmake -y
    sudo apt-get install libomxil-bellagio-dev -y
    sudo apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev -y
    sudo apt-get install autoconf gettext libtool libjpeg62-dev -y
    sudo apt-get install libv4l-dev v4l-utils -y

}
build() {
    git clone https://github.com/sanarea/mjpg-streamer.git
    cd mjpg-streamer/mjpg-streamer-experimental
    make
    sudo make install
}
do_install() {
    apt_update
    pm2_install
}
echo "INSTALL PI"
do_install
