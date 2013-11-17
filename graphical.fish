#!usr/bin/fish
# xbox 360 controller stuff
sudo add-apt-repository ppa:grumbel/ppa
sudo apt-get update
sudo apt-get install xboxdrv
#Spotify
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list'
sudo apt-get update
sudo apt-get install spotify-client
# XBMC
sudo apt-get install python-software-properties pkg-config
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:team-xbmc/ppa
sudo apt-get update
sudo apt-get install xbmc
