#!/bin/bash
## Script de rotação de tela e touchscreen para linux.
## git @diego-mpereira VideoSoft
echo -n "Orientação de rotação de tela desejada: 
1-Right 
2-Left 
3-Normal 
4-Inverted 
"
read orientacao
if [ "$orientacao" -eq "1" ]; then
      matrix="0 1 0 -1 0 1 0 0 1";
      rotscreen="right";
fi
if [ "$orientacao" -eq "2" ];
then
      matrix="0 -1 1 1 0 0 0 0 1";
      rotscreen="left";
fi
if [ "$orientacao" -eq "3" ];
then
      matrix="1 0 0 0 1 0 0 0 1";
      rotscreen="normal";
fi
if [ $"$orientacao" -eq "4" ];
then
      matrix="-1 0 1 0 -1 1 0 0 1";
      rotscreen="inverted";
fi
# Ler modelo do TouchPad Instalado
installedTouch=$(xinput list --name-only | grep "Touch" | head -n 1)
##installedTouch=\"${installedTouch}\"
# Criar script temporario para Rotacionar Touchpad
echo "xinput set-prop \"${installedTouch}\" \"Coordinate Transformation Matrix\" ${matrix}" >>/tmp/rotacionatouch.sh
# Rotacionar Touchpad
bash /tmp/rotacionatouch.sh
# Remover script temporario
rm /tmp/rotacionatouch.sh
echo "Touch ok"
# Ler nome do monitor ativo
activeDisplay=$(xrandr | grep " connected " | awk '{ print$1 }')
# Rotacionar tela
xrandr --output $(echo $activeDisplay) --mode 1920x1080 --rotate ${rotscreen}
echo "Tela ok"
echo "done"
sleep 3 && clear
