#!/bin/bash

current_background_dir="${HOME}/.config/hyprpaper/"
backgrounds_dir="${HOME}/.config/hyprpaper/assets/"
background_name="${HOME}/.config/hyprpaper/assets/current_background.png"

# Get information about the backgrounds
background_count=$(ls "$backgrounds_dir" -1 | wc -l)
backgrounds=("$backgrounds_dir"*)

# Randomly select a new background
new_background_index="$(($RANDOM % ${background_count}))"

# Set the new background
new_background="${backgrounds[${new_background_index}]}"
swww img "${new_background}" --transition-type left --transition-fps 60
