sudo snap install dbeaver-ce insomnia
sudo apt install -y awscli python3.6

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo apt install -y ./google-chrome-stable_current_amd64.deb

mkdir ~/.config/autostart
cp autostart/* ~/.config/autostart/

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker "$(whoami)"
sudo chmod 666 /var/run/docker.sock

# Create app to teams
# Add bitbucket ssh
