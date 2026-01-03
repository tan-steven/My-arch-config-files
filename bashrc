#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
#--------------------------
#exports
#--------------------------
export EDITOR=nvim
export BROWSER=firefox
export TERMINAL=kitty
export PATH="~/.local/bin:$PATH"
export FILE_MANAGER=thunar

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

#-------------------------
#aliases
#-------------------------
alias vi="$EDITOR"
alias vim="$EDITOR"
alias code="vscodium"

#--------------------------
#custom commands
#--------------------------

alias vi="NVIM_APPNAME=nvim nvim"
alias vic="NVIM_APPNAME=nvchad nvim"

function nvims() {
  items=("nvim" "nvchad")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bind '"\C-a": "nvims\n"'

clear() {
  command clear
  fastfetch
}
fastfetch
