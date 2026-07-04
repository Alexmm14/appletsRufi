#!/usr/bin/env bash

# 1. Definir las opciones que se mostrarán en Rofi
opciones="🔒 Bloquear\n🔄 Reiniciar\n🛑 Apagar"

# 2. Pasar las opciones a rofi en modo dmenu y guardar la selección
seleccionado=$(echo -e "$opciones" | rofi -dmenu -i -p "Sistema:")

# 3. Ejecutar la acción según lo que se seleccionó
case "$seleccionado" in
    *"Bloquear")
        # Aquí pones tu comando de bloqueo (ej: i3lock, superior-lock, etc.)
        loginctl lock-session
        ;;
    *"Reiniciar")
        systemctl reboot
        ;;
    *"Apagar")
        systemctl poweroff
        ;;
esac
