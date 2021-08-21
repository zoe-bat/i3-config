#!/bin/zsh
playerwhitelist=$(cat ~/.i3/playerwhitelist)
positon=$(playerctl -p $playerwhitelist position);
length=$(playerctl metadata mpris:length);
length=$(($length / 1000000))


length=$(echo $length)
positon=$(echo $positon)

positionPercentage=$(($positon / $length))
positionPercentage=$(($positionPercentage * 100))

printf '%.*f\n' 0 $positionPercentage
