set -euxo pipefail

## Oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install-omf
chmod +x ./install-omf
./install-omf --noninteractive
rm ./install-omf

source ~/.config/fish/config.fish

omf install robbyrussell fzf nvm

## Base 16 shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

cp ./fish/config.fish ~/.config/fish/config.fish
source ~/.config/fish/config.fish

nvm install 16

ssh-keygen -t RSA -b 2048
mwinit -o
toolbox install brazilcli cr rde

sudo mkdir -p -m 755 /workplace/{$USER}
sudo chown -R {$USER}:amazon /workplace/{$USER}
ln -s /workplace/{$USER} ~/workplace

fish_update_completions
