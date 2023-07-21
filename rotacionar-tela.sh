#!/bin/bash
## Script de rotação de tela no início do sistema
## git @diego-mpereira VideoSoft
sleep 2
echo "sleep 2" >>/tmp/rotacionar-tela.sh
activeDisplay=$(xrandr | grep " connected " | awk '{ print$1 }')
declare -a testeArr=($activeDisplay)
for key in "${!testeArr[@]}"
do
	monitor=${testeArr[$key]}
	display="monitor${monitor}"
	echo "xrandr --output $monitor --mode 1920x1080 --rotate right" >>/tmp/rotacionar-tela.sh
	echo "xfconf-query --channel xfce4-desktop --property /backdrop/screen0/${display}/workspace0/last-image --set /opt/videosoft/scripts/image-install/videosoft-vertical.png" >>/tmp/wallpaper.sh
done
echo "[Desktop Entry]" >>~/.config/autostart/rotacionar-tela.desktop
echo "Name=RotacionarTela" >>~/.config/autostart/rotacionar-tela.desktop
echo "Type=Application" >>~/.config/autostart/rotacionar-tela.desktop
echo "Exec=bash /opt/videosoft/scripts/init/rotacionar-tela-sh" >>~/.config/autostart/rotacionar-tela.desktop
chmod +x ~/.config/autostart/rotacionar-tela.desktop



echo "**********             Inserir init scripts     **************"
sudo mkdir -p /opt/videosoft/scripts/init/
sudo mv /tmp/rotacionar-tela.sh /opt/videosoft/scripts/init/
sudo chmod +x /opt/videosoft/scripts/init/rotacionar-tela.sh
echo "*****************Instalação Concluida*************************"
exit
