# https://github.com/LierB/dotfiles/

requiredpacks ()
{
pacman -S git zsh kitty waybar hyprlock wofi btop pavucontrol blueman networkmanager nm-connection-editor imagemagick
yay -S hyprland
yay -S python-pywal
yay -S wlogout
yay -S swww
yay -S grimblast-git

}
if [[ "${UID}" != 0 ]] ; then
	echo -e "please run this script as with root privileges:\n\tsudo sh ./install.sh"
	exit 1
fi
clear

banner(){
echo -e "\033[1;36m
    ╱|、
  (˚ˎ 。7   Bina's Dotfiles
   |、˜〵   \033[0;105mHyprland Arch config based on pywal!\033[0m       
   じしˍ,)ノ                                     
"
        echo -ne "\e[0;32m Do you want to install optional packages? (Y/N) " ; read islem
}

banner
if [[ $islem == y || $islem == Y ]]; then
echo -e '\e[1;34m Backing Up...\033[0m'
mkdir Backup
cp -r /home/$USER/.config/btop/ /home/$USER/.config/cava/ /home/$USER/.config/fastfetch/ /home/$USER/.config/hypr/ /home/$USER/.config/kitty/ /home/$USER/.config/neofetch/ Backup/
cp -r /home/$USER/.zshrc Backup/

echo -e '\e[1;34m Installing required packages\033[0m'
if ! command -v yay
then
    	clear
    	echo -e "\033[1;31m
Yay Not Found!\033[0m"
exit 1
fi
requiredpacks

echo -e '\e[1;34m Installing optional packages\033[0m'
pacman -S fastfetch neofetch zathura zoxide
yay -S cava
yay -S tty-clock.git
yay -S snake.git

echo -e '\e[1;34mCopying config files...\033[0m'
rm -r /home/$USER/.zshrc
cp -r .zshrc /home/$USER/
rm -r /home/$USER/.config/btop /home/$USER/.config/cava /home/$USER/.config/fastfetch /home/$USER/.config/hypr /home/$USER/.config/kitty /home/$USER/.config/neofetch
cd config/ && cp -r btop cava fastfetch-theme-selector fastfetch hypr kitty neofetch wal waybar wlogout wofi zathura /home/$USER/.config/
cd ..
sleep 3
clear
cd ..
echo -e '\e[1;34mThe files have been uploaded to your system and the necessary packages have been installed.'
echo -e '\e[31mEnjoy ricing!\033[0m'

elif [[ $islem == n || $islem == N ]]; then
	clear
echo -e '\e[1;34m Backing Up...\033[0m'
mkdir Backup
cp -r /home/$USER/.config/btop/ /home/$USER/.config/cava/ /home/$USER/.config/fastfetch/ /home/$USER/.config/hypr/ /home/$USER/.config/kitty/ /home/$USER/.config/neofetch/ Backup/
cp -r /home/$USER/.zshrc Backup/

echo -e '\e[1;34m Installing required packages\033[0m'
if ! command -v yay
then
    	clear
    	echo -e "\033[1;31m
Yay Not Found!\033[0m"
exit 1
fi
requiredpacks

echo -e '\e[1;34mCopying config files...\033[0m'
rm -r /home/$USER/.zshrc
cp -r .zshrc /home/$USER/
rm -r /home/$USER/.config/btop /home/$USER/.config/cava /home/$USER/.config/fastfetch /home/$USER/.config/hypr /home/$USER/.config/kitty /home/$USER/.config/neofetch
cd config/ && cp -r btop cava fastfetch-theme-selector fastfetch hypr kitty neofetch wal waybar wlogout wofi zathura /home/$USER/.config/
cd ..
sleep 3
clear
cd ..
echo -e '\e[1;34mThe files have been uploaded to your system and the necessary packages have been installed.'
echo -e '\e[31mEnjoy ricing!\033[0m'
 else
	echo -e '\033[36;40;1m Wrong transaction number!\033[0m'	
fi
