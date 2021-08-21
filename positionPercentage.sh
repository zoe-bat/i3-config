#!/bin/zsh
positon=$(playerctl position);
length=$(playerctl metadata mpris:length);
length=$(($length / 1000000))


length=$(echo $length)
positon=$(echo $positon)

positionPercentage=$(($positon / $length))
positionPercentage=$(($positionPercentage * 100))

printf '%.*f\n' 0 $positionPercentage
