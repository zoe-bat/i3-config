#!/bin/bash

i3status --config ~/.i3/i3status.conf | while :
do
    read line

# putting ur own shell scripts here is cool!

#francis tells me what music is playing!
playerwhitelist="cmus,Lollypop,clementine,rhythmbox,mpv"
playerctlstatus=$(playerctl -p $playerwhitelist status)
title=$(playerctl -p $playerwhitelist metadata title)
artist=$(playerctl -p $playerwhitelist metadata artist)
players=$(playerctl -p $playerwhitelist -f '{{playerName}}' status;echo 🖭)
hearts='.₊̣̇.♥♪'
position=$(echo $(zsh /home/zoe/.i3/positionPercentage.sh)"%")

#react to volume when awake
volume=$(pamixer --get-volume)

if [ $volume -ge 100 ]
then franciswake="(☆w☆)"; francissleep="(U ﹏ U)"

elif [[ $volume -lt 100 && $volume -gt 74 ]]
then franciswake="(≧◡≦)"; francissleep="(∪｡∪)｡｡｡zzz"

elif [[ $volume -lt 75 && $volume -gt 49 ]]
then franciswake="(*⌒▽⌒*)θ～♪"; francissleep="(´〜｀*) zzz"

elif [[ $volume -lt 50 && $volume -gt 24 ]]
then franciswake="ಇ( ꈍᴗꈍ)"; francissleep="(-_-) zzz"

elif [[ $volume -lt 25 && $volume -gt 0 ]]
then franciswake="(ᵕᴗ ᵕ⁎)"; francissleep="(-, – )…zzzZZZ"

elif [[ $volume -le 0 ]]
then franciswake="(─‿‿─)♡"; francissleep="(ᴗ˳ᴗ)"

else franciswake="(x_x)"; francissleep="(x_x)"
fi

playing=$(

if [[ $playerctlstatus = *"Playing"* ]];

then
    echo $players "▶ "$hearts $franciswake $artist - $title $position
else
    echo $players "⏸ "$hearts $francissleep
fi
)

echo -n $playing "|" $line || exit 2
done
