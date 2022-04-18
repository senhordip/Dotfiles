#!/usr/bin/env bash

# options
shutdown=" Desligar"
reboot=" Reiniciar"
suspend=" Suspender"
lock=" Bloquear"
logout=" Encerrar Sessão"
cancel="Cancelar"

options="$cancel\n$shutdown\n$reboot\n$suspend\n$lock\n$logout"
uptime=$(uptime -p | sed -e 's/up //g')

dir=".config/rofi/themes/"
theme="rofi -theme $dir/dracula.rasi"
chosen="$(echo -e "${options}" | rofi -dmenu -config $theme -p "Uptime - $uptime" -lines 6 -width 20)"           

case "${chosen}" in
    $shutdown)
       systemctl poweroff
       ;;

    $reboot)
       systemctl reboot
        ;;

    $suspend)
       systemctl suspend
        ;;

    $lock)
       i3lock
        ;;

    $logout)
       bspc quit
        ;;
esac
