#!/bin/bash -xe

parentdir="$(dirname "$PWD")"

#currentshell="$(basename $SHELL)"
currentshell="zsh"

if [ "$currentshell" == "bash" ]; then
  echo "Current shell is bash"
elif [ "$currentshell" == "zsh" ]; then
  echo "Current shell is zsh"
  dotfile="$HOME/.zshrc"
  #if [ -f "$dotfile"]; then
  if [[ -f $dotfile ]]; then
    mv "$dotfile" "$dotfile.bak"
  else
    echo "$dotfile does not exist"
  fi
  echo "source $parentdir/.zshrc" > "$dotfile"
  MARKPATH=$HOME/.marks
  if [[ ! -d $MARKPATH ]]; then
    mkdir $MARKPATH
  fi
  echo "source $parentdir/.zshrc.mark" >> "$dotfile"
  echo "source $parentdir/.zshrc.all" >> "$dotfile"
  touch "$HOME/.zshrc.local"
  echo "source $HOME/.zshrc.local" >> "$dotfile" # Have a dotfile that only keeps local changes. Wont be committed to the repo. Is intentionally run last to override everything else. Is also untouched by all scripts here, so rerunning them is safe
fi

#ln -s "$parentdir/.vimrc" ~/.vimrc
./setup_vim.sh
./setup_backup.sh

