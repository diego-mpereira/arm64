#!/bin/bash
## Script de rotação de tela e touchscreen para linux.
## git @diego-mpereira VideoSoft
# Ler modelo do TouchPad Instalado
installedTouch=$(xinput list --name-only | grep "Touch" | head -n 1)
# Rotacionar Touchpad
xinput set-prop "${installedTouch}" "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
# Ler nome do monitor ativo
activeDisplay=$(xrandr | grep " connected " | awk '{ print$1 }')
# Rotacionar tela
xrandr --output $activeDisplay --mode 1920x1080 --rotate right
