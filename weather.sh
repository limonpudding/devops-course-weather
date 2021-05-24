#!/bin/bash

if [ -z $1 ];
then
	echo 'City is not specified! Try again.'
	exit
fi

if [ ! -z $2 ];
then
	if [ $2 = 'i' ];
	then
		echo 'Updating repo...'
		apt update

		echo 'Installing required software...'
		packages='curl jq'

		for package in $packages
		do
			echo 'Installing '$package
			apt install $package -y
		done

		echo $'Done!\n'
	else
		echo 'Unknown parameter '$2
	fi
fi

temp=$(curl -s wttr.in/$1?format=j1 | jq -r '.current_condition[0].temp_C')
humidity=$(curl -s wttr.in/$1?format=j1 | jq -r '.current_condition[0].humidity')

echo 'Weather in '$1
echo 'Temperature '$temp'C'
echo 'Humidity '$humidity'%'
