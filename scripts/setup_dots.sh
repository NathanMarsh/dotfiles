#!/bin/bash -xe

parentdir="$(dirname "$PWD")"

#currentshell="$(basename $SHELL)"
currentshell="zsh"
zshenvfile="$HOME/.zshenv"

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
  #echo "source $parentdir/.zshrc" > "$dotfile" ## Removing this since we removed .zshrc
  MARKPATH=$HOME/.marks
  if [[ ! -d $MARKPATH ]]; then
    mkdir $MARKPATH
  fi
  echo "source $parentdir/.zshrc.mark" >> "$dotfile"
  echo "source $parentdir/.zshrc.all" >> "$dotfile"
  touch "$HOME/.zshrc.local"
  sourceLocalString="source $HOME/.zshrc.local"
  if ! grep -q "$sourceLocalString" "$zshenvfile"; then
    echo "$sourceLocalString" >> "$zshenvfile"
  fi
  echo "source $HOME/.zshrc.local" >> "$dotfile" # Have a dotfile that only keeps local changes. Wont be committed to the repo. Is intentionally run last to override everything else. Is also untouched by all scripts here, so rerunning them is safe
  echo "export NADOT_HOME=\"$parentdir\"" >> "$dotfile"
fi

## git stuff ##

GITCONFIGPATH="/home/$USER/.gitconfig"
if [[ -f "$GITCONFIGPATH" ]]; then
  mv "$GITCONFIGPATH" "$GITCONFIGPATH.old.$RANDOM"
fi

#touch "$HOME/.gitconfig.local"
#ln -fs "$parentdir/.gitconfig" "$HOME"
## end git stuff ##
#ln -s "$parentdir/.vimrc" ~/.vimrc
#./setup_vim.sh ## Not doing this till script is stable
./setup_backup.sh

