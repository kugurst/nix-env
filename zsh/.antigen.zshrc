#[[ ! $TERM == "eterm-color" ]] && [[ $- == *i* ]] && [[ ! $TERM == "dumb" ]] && [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux

export EDITOR=vim
export LANG=en_US.UTF-8

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

[[ ! $TERM == "dumb" ]] && source ~/.antigenrc

if [[ -n "$INSIDE_EMACS" && "$TERM" == "eterm-color"  ]]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi

alias svim='sudo vim'
alias srmr='sudo rm -rf'
alias srm='sudo rm'

alias pacman='sudo pacman'
alias shutdown='sudo shutdown'
alias ys='yaourt -S'
alias ysyu='yaourt -Syu --aur'
alias ysy='yaourt -Sy'
alias ysyy='yaourt -Syy'
alias yr='yaourt -R'

alias rmr='rm -rf'
alias cp='cp -r'
alias ll='ls -alF -h'
alias cp='cp -r'
alias grep='grep --color=auto'

function eterm-reset {
    echo -e "\033AnSiTu" $(whoami)
    echo -e "\033AnSiTc" $(pwd)
    echo -e "\033AnSiTh" $(hostname)
}

function alias_ssh {
    ssh $@ ; eterm-reset
}

alias ssh='alias_ssh'

