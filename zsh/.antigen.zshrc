#[[ ! $TERM == "eterm-color" ]] && [[ $- == *i* ]] && [[ ! $TERM == "dumb" ]] && [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
PAT="$PATH"
PATH=""

function add_to_path {
    zparseopts -D -E -- r::=R

    ADDR=("${(@s/:/)1}")
    for i in "${ADDR[@]}"; do
        if [[ ! "$PATH" == *"$i"* ]]; then
            if [[ ! -z "$R" ]]; then
                PATH="$PATH:$i"
            else
                PATH="$i:$PATH"
            fi
        fi
    done

    if [[ "$PATH" == ":"* ]]; then
        PATH="${PATH#":"}"
    elif [[ "$PATH" == *":" ]]; then
        PATH="${PATH%":"}"
    fi

    export PATH="$PATH"
}

add_to_path -r "$PAT"

export EDITOR=emacs
export LANG=en_US.UTF-8
export WINEARCH="win32"
export STEAM_FRAME_FORCE_CLOSE=1

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

alias mount='sudo mount'
alias umount='sudo umount'
alias eject='sudo eject'
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
alias reload='. ~/.zshrc'
alias copy='xclip -sel primary'

source /usr/share/doc/pkgfile/command-not-found.zsh
source ~/.quartus_path

add_to_path -r "/home/mark/vdent/bin"

export rvmsudo_secure_path=0
[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"
