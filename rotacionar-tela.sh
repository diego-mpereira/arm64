#!/bin/bash
## Script de rotação de tela no início do sistema
## git @diego-mpereira VideoSoft

## Ler modelo do TouchPad Instalado
installedTouch=$(xinput list --name-only | grep "Touch" | head -n 1)
## Rotacionar Touchpad
xinput set-prop "${installedTouch}" "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
## Sleep
sleep 2
activeDisplay=$(xrandr | grep " connected " | awk '{ print$1 }')
declare -a testeArr=($activeDisplay)
for key in "${!testeArr[@]}"
do
	monitor=${testeArr[$key]}
	display="monitor${monitor}"
	xrandr --output $monitor --mode 1920x1080 --rotate right
	xfconf-query --channel xfce4-desktop --property /backdrop/screen0/${display}/workspace0/last-image --set /opt/videosoft/scripts/image-install/videosoft-vertical.png
done
