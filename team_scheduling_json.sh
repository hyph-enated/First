#!/bin/bash

while true
do 
  read -p "Enter Employee Name: " name
  echo $name

  if [[ $name == "print" ]]
  then
    echo "End Process"                                
    break
  fi

  read -p "Enter Shift (morning, mid, night): " shift
  echo $shift

  read -p "Enter Team (a1, a2, a3, b1, b2, b3): " team
  echo $team

  json_structure=$(jq -n --arg name "$name" --arg shift "$shift" --arg team "$team" '{name: $name, shift: $shift, team: $team}')

  if [ ! -s data/data.json ]
  then
    echo "[]" > data/data.json
  fi

  jq ". += [$json_structure]" data/data.json > data/tmp.json && mv data/tmp.json data/data.json


done

