#!/bin/bash
## Script de rotação de tela no início do sistema
## git @diego-mpereira VideoSoft

## Ler modelo do TouchPad Instalado
installedTouch=$(xinput list --name-only | grep "Touch" | head -n 1)
## Rotacionar Touchpad
xinput set-prop "${installedTouch}" "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
# Ler nome do monitor ativo
activeDisplay=$(xrandr | grep " connected " | awk '{ print$1 }')
declare -a testeArr=($activeDisplay)
for key in "${!testeArr[@]}"
do
	monitor=${testeArr[$key]}
	display="monitor${monitor}"
 # Rotacionar tela para cada monitor ativo
	xrandr --output $monitor --mode 1920x1080 --rotate right
done
