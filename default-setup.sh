echo welcome to the dotfiles installation
echo if you get any error,report to my discord:_._eterna_._
echo copying files to .config...
cd defaultc && cp -r alacritty  dunst  i3  polybar rofi zsh  $HOME/.config 
cd -
echo copying wallpapers to /pictures/backdrops...
cp -r backdrops $HOME/pictures
echo enabling kvantum...
QT_QPA_PLATFORMTHEME=kvantum
echo please restart your computer for changing theme.
echo installing neocat...
cd Smile-NeoCat-Theme && bash ./smile-neocat.sh 
echo done! 
