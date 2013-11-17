# This script first sets up commandline centric things
# Install homesick to setup dotfiles
# TODO: Add options for some of this stuff
# TODO: Add yes to all options for apt-get install stuff
# See if graphical programs should be installed
echo 'Should graphical programs be installed? yes or no?'
# TODO: Add input validation loop
read installGraphical

# Install programming language stuff

# Install Ruby stuff 
# Install and configure rvm
# Install curl so I can install RVM
echo 'sudo apt-get -y install curl'
sudo apt-get -y install curl
echo 'curl -L get.rvm.io | bash -s stable'
curl -L get.rvm.io | bash -s stable
# RVM fish functions
echo 'curl --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish'
curl --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
# Install and make default Ruby 2.0.0
echo 'rvm install 2.0.0'
rvm install 2.0.0
echo 'rvm use --default 2.0.0'
rvm use --default 2.0.0
# Install python stuff
echo 'sudo apt-get install -y python-pip'
sudo apt-get install -y python-pip
echo 'sudo pip install -y virtualenv'
sudo apt-get install -y python-virtualenv
# Install Java/Scala stuff
echo 'sudo apt-get install -y openjdk-7-jdk'
sudo apt-get install -y openjdk-7-jdk
echo 'curl -O http://www.scala-lang.org/files/archive/scala-2.10.3.deb'
curl -O http://www.scala-lang.org/files/archive/scala-2.10.3.deb
echo 'sudo dpkg -i scala-2.10.3.deb'
sudo dpkg -i scala-2.10.3.deb
echo 'rm scala-2.10.3.deb'
rm scala-2.10.3.deb

# TODO: install eclipse and eclipse plugins

# Extra command line stuff
echo 'sudo apt-get install -y cowsay'
sudo apt-get install -y cowsay
echo 'sudo apt-get install -y xclip'
sudo apt-get install -y xclip

# Shell config and dotfile stuff
echo 'sudo chsh -s /usr/bin/fish'
sudo chsh -s /usr/bin/fish
echo 'sudo gem install homesick'
sudo gem install homesick
echo 'homesick clone CADBOT/dotfiles'
homesick clone CADBOT/dotfiles
#backup old rm .config to avoid the conflict error
echo 'cd ~'
cd ~
echo 'mv .config .configBackup'
mv .config .configBackup
echo 'homesick symlink dotfiles'
homesick symlink dotfiles
# Move none fish stuff in .configBackup back to .config
echo 'rm -r .configBackup/fish'
rm -r .configBackup/fish
mv .configBackup/* .config
rm r .configBackup

# Install Vundle and other plugins
echo 'git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle'
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Use fish function to install vim vundle bundle stuff
echo 'updatevim'
updatevim
#echo 'vim +BundleInstall +qall'
#vim +BundleInstall +qall 


# To wrap up
echo 'sudo apt-get -f install'
sudo apt-get -f install

# GUI programs
#Install steam
if [ $installGraphical = 'yes' ]
  #Instal stuff for 360 controller
  sudo add-apt-repository ppa:grumbel/ppa
  sudo apt-get update && sudo apt-get install xboxdrv
  #Spotify
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E
  sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list'
  sudo apt-get update && sudo apt-get install spotify-client
  # XBMC
  sudo apt-get install python-software-properties pkg-config
  sudo apt-get install software-properties-common
  sudo add-apt-repository ppa:team-xbmc/ppa
  sudo apt-get update
  sudo apt-get install xbmc
end




