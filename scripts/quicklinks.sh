#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Quick Links

# Chrome Profiles
MOLINAA757="Default"
DROPDATABASEALEJANDRO="Profile 1"
ALEJANDROMOLINAMEDINA="Profile 2"
BROWSER="Google-Chrome"

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt='Quick Links'
mesg="Using '$BROWSER' as web browser"

if [[ ( "$theme" == *'type-1'* ) || ( "$theme" == *'type-3'* ) || ( "$theme" == *'type-5'* ) ]]; then
	list_col='1'
	list_row='6'
elif [[ ( "$theme" == *'type-2'* ) || ( "$theme" == *'type-4'* ) ]]; then
	list_col='6'
	list_row='1'
fi

if [[ ( "$theme" == *'type-1'* ) || ( "$theme" == *'type-5'* ) ]]; then
	efonts="JetBrains Mono Nerd Font 10"
else
	efonts="JetBrains Mono Nerd Font 28"
fi

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1=" Spotify"
	option_2=" WhatsApp"
	option_3=" Gemini"
	option_4=" Github"
	option_5=" Teams (Pers)"
	option_6=" Teams (Trab)"
else
	option_1=""
	option_2=""
	option_3=""
	option_4=""
	option_5=""
	option_6=""
fi

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: 6; lines: 1;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-theme-str "element-text {font: \"$efonts\";}" \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		flatpak run com.spotify.Client
	elif [[ "$1" == '--opt2' ]]; then
		/opt/google/chrome/google-chrome --profile-directory="$MOLINAA757" --app-id=hnpfjngllnobngcgfapefoaidbinmjnm --class=whatsapp-desktop
	elif [[ "$1" == '--opt3' ]]; then
		/opt/google/chrome/google-chrome --profile-directory="$MOLINAA757" --app-id=aenkghcjmafhmiloejakejkpbhaipmjc --class=gemini-desktop
	elif [[ "$1" == '--opt4' ]]; then
		google-chrome-stable --profile-directory="$MOLINAA757" 'https://www.github.com/'
	elif [[ "$1" == '--opt5' ]]; then
		google-chrome-stable --profile-directory="$DROPDATABASEALEJANDRO" 'https://teams.microsoft.com/'
	elif [[ "$1" == '--opt6' ]]; then
		google-chrome-stable --profile-directory="$ALEJANDROMOLINAMEDINA" 'https://teams.microsoft.com/'
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
		run_cmd --opt4
        ;;
	$option_5)
		run_cmd --opt5
        ;;
	$option_6)
		run_cmd --opt6
        ;;
esac
