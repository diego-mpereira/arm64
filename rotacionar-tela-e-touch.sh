#!/bin/bash
## Script de rotação de tela e touchscreen para linux.
## git @diego-mpereira VideoSoft
echo -n "Orientação de rotação de tela desejada: 1-Right 2-Left 3-Normal 4-Inverted" 
read orientacao
if [ -z $orientacao ]
then
      exit
elseif [ $orientacao = 1 ]
      matrix="0 1 0 -1 0 1 0 0 1"
      rotscreen="right"
elseif [ $orientacao = 2 ] 
      matrix="0 -1 1 1 0 0 0 0 1"
      rotscreen="left"
elseif [ $orientacao = 3 ] 
      matrix="1 0 0 0 1 0 0 0 1"
      rotscreen="normal"
elseif [ $orientacao = 4 ] 
      matrix="-1 0 1 0 -1 1 0 0 1"
      rotscreen="inverted"
fi
echo $orientacao
# Ler modelo do TouchPad Instalado
installedTouch=$(xinput list --name-only | grep "Touch" | head -n 1)
# Rotacionar Touchpad
xinput set-prop "${installedTouch}" "Coordinate Transformation Matrix" ${matrix}
# Ler nome do monitor ativo
activeDisplay=$(xrandr | grep " connected " | awk '{ print$1 }')
# Rotacionar tela
xrandr --output $activeDisplay --mode 1920x1080 --rotate ${rotscreen}
