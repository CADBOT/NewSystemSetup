# This script first sets up commandline centric things
# Install homesick to setup dotfiles
# TODO: Add options for some of this stuff
# TODO: Add yes to all options for apt-get install stuff
# See if graphical programs should be installed
echo 'Should graphical programs be installed? yes or no?'
# TODO: Add input validation loop
read installGraphical
sudo gem install homesick
homesick clone CADBOT/dotfiles
homesick symlink dotfiles

# Install programming language stuff

# Install Ruby stuff 
# Install and configure rvm
\curl -L https://get.rvm.io | bash
# RVM fish functions
curl --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
# Install and make default Ruby 2.0.0
rvm install 2.0.0
rvm use --default 2.0.0
# Install python stuff
sudo apt-get install python-pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper
# Install Java/Scala stuff
sudo apt-get install openjdk-7-jdk
curl -O http://www.scala-lang.org/files/archive/scala-2.10.3.deb
sudo dpkg -i scala-2.10.3.deb
rm scala-2.10.3.deb

# TODO: install eclipse and eclipse plugins

# Extra command line stuff
sudo apt-get install cowsay
sudo apt-get install xclip

# GUI programs
#Install steam
if [ $installGraphical = 'yes' ]
  curl -O http://media.steampowered.com/client/installer/steam.deb
  sudo dpkg -i steam.deb
  rm steam.deb
end
