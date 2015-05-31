#!/bin/sh
echo "#################################"
echo "####### Shell Provisioner #######"
echo "####### RoomForward, Inc. #######"
echo "#################################"

echo -e "\n=> Configuring Bash colors...\n"
echo "# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White
" >>  ~/.bashrc
echo "==> done..."

echo -e "\n=> Downloading and installing git...\n"
echo "Y" | sudo apt-get install git
echo "==> done..."

echo -e "\n=> Downloading and installing curl...\n"
echo "Y" | sudo apt-get install curl
echo "==> done..."

echo -e "\n=> Downloading and installing rvm...\n"
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
echo "=> Loading RVM..."
source /home/vagrant/.rvm/scripts/rvm
echo "[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*" >> ~/.bashrc
echo "==> done..."

echo -e "\n=> Downloading and installing nodejs...\n"
echo "Y" | sudo apt-get install nodejs
echo "==> done..."

echo -e "\n=> Downloading and installing Byobu...\n"
echo "Y" | sudo apt-get install byobu
echo "==> done..."

echo -e "\n=> Configuring Byobu...\n"
echo -ne '\n' | byobu-enable
echo "==> done..."

echo -e "\n=> Configuring Git...\n"
git config --global color.ui true
git config --global alias.ms 'merge --squash'
git config --global alias.ff 'pull --ff-only'
git config --global alias.gl "log --branches --remotes --graph --pretty='format:%C(yellow)%h%Cblue%d%Creset %s %C(green) %an, %ar%Creset'"
git config --global alias.ll 'log --stat --abbrev-commit'
git config --global alias.co checkout
git config --global alias.s status
git config --global alias.ignore '!gi() { curl -s http://www.gitignore.io/api/$@ ;}; gi'
echo "==> done..."

echo -e "\n=> Configuring PostgreSQL 9.4...\n"
sudo locale-gen en_US.UTF-8
sudo echo "LANG=en_US.UTF-8
LANGUAGE=
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=en_US.UTF-8
" | sudo tee /etc/default/locale
sudo /usr/sbin/update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" | sudo tee -a /etc/apt/sources.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
echo "Y" | sudo apt-get install postgresql-9.4 libpq-dev
sudo -u postgres createuser -a vagrant
echo "==> done..."

echo -e "\n=> Configuring Bash...\n"
sed -i '1i if [ -f ~/.bashrc ]; then\n   source ~/.bashrc\nfi' ~/.bash_profile
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
echo "# Load in the git branch prompt script." >> ~/.bashrc
echo "source ~/.git-prompt.sh" >> ~/.bashrc
echo 'PS1="\[$Yellow\]\u@\[$Cyan\]\h\[$White\]:\[$Purple\]\w\[\033[m\]\[$BIBlue\]\$(__git_ps1)\[$White\]\$ "' >> ~/.bashrc
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
echo "# Load in the git auto-complete script." >> ~/.bashrc
echo "source ~/.git-completion.bash" >> ~/.bashrc
echo "cd /code/" >> ~/.bashrc
source ~/.bashrc
echo "==> done..."

echo -e "\n#################################"
echo    "##### Provisioning complete! #####"
echo -e "#################################\n"