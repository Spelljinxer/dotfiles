#!/usr/bin/env bash


dir="$HOME/.config/rofi/gruvbox"
theme="gruvbox"

rofi \
    -show drun \
    -theme $dir/${theme}.rasi
