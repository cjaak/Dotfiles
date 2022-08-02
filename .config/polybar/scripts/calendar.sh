!/usr/bin/env bash

source ~/.config/zsh/exports.zsh

cd ~/Documents/notes/school-setup/

if [[ $1 == "end" ]]; then
  ./main.py --calendar --end
else
  python -u main.py --calendar
fi
