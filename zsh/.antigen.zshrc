#[[ ! $TERM == "eterm-color" ]] && [[ $- == *i* ]] && [[ ! $TERM == "dumb" ]] && [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
# PAT="$PATH"
# PATH=""
# 
# function add_to_path {
#     zparseopts -D -E -- r::=R
# 
#     ADDR=("${(@s/:/)1}")
#     for i in "${ADDR[@]}"; do
#         if [[ ! "$PATH" == *"$i"* ]]; then
#             if [[ ! -z "$R" ]]; then
#                 PATH="$PATH:$i"
#             else
#                 PATH="$i:$PATH"
#             fi
#         fi
#     done
# 
#     if [[ "$PATH" == ":"* ]]; then
#         PATH="${PATH#":"}"
#     elif [[ "$PATH" == *":" ]]; then
#         PATH="${PATH%":"}"
#     fi
# 
#     export PATH="$PATH"
# }
# 
# add_to_path -r "$PAT"

# if [ -f ~/isolate_path.py ]; then
#     export PATH="$(/usr/bin/python3 ~/isolate_path.py)"
# fi

export EDITOR=vim
export LANG=en_US.UTF-8
export WINEARCH="win32"
export STEAM_FRAME_FORCE_CLOSE=1
#export CYGWIN="winsymlinks:nativestrict"

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

function startx_from_home_dir {
    cd
    startx
}

alias ssh='alias_ssh'
alias startx='startx_from_home_dir'
alias reload='. ~/.zshrc'
alias copy='xclip -sel primary'

semacs () {
    SASS_PATH="/home/mark/cinnamonroll/app/assets/images:/home/mark/cinnamonroll/app/assets/javascripts:/home/mark/cinnamonroll/app/assets/stylesheets:/home/mark/cinnamonroll/vendor/assets/javascripts:/home/mark/cinnamonroll/vendor/assets/stylesheets:/usr/local/rvm/gems/ruby-head@personal_server/gems/turbolinks-2.5.3/lib/assets/javascripts:/usr/local/rvm/gems/ruby-head@personal_server/gems/angularjs-rails-1.4.7/vendor/assets/javascripts:/usr/local/rvm/gems/ruby-head@personal_server/gems/jquery-ui-rails-5.0.5/app/assets/images:/usr/local/rvm/gems/ruby-head@personal_server/gems/jquery-ui-rails-5.0.5/app/assets/javascripts:/usr/local/rvm/gems/ruby-head@personal_server/gems/jquery-ui-rails-5.0.5/app/assets/stylesheets:/usr/local/rvm/gems/ruby-head@personal_server/gems/jquery-rails-4.0.5/vendor/assets/javascripts:/usr/local/rvm/gems/ruby-head@personal_server/gems/js-routes-1.1.2/app/assets/javascripts:/usr/local/rvm/gems/ruby-head@personal_server/gems/coffee-rails-4.1.0/lib/assets/javascripts:/usr/local/rvm/gems/ruby-head@personal_server/gems/foundation-rails-5.5.1.2/vendor/assets/javascripts:/usr/local/rvm/gems/ruby-head@personal_server/gems/foundation-rails-5.5.1.2/vendor/assets/stylesheets:/usr/local/rvm/gems/ruby-head@personal_server/gems/susy-2.2.7/sass" emacs $@ & disown
}

[[ -e "/usr/share/doc/pkgfile/command-not-found.zsh" ]] && source /usr/share/doc/pkgfile/command-not-found.zsh
[[ -e "$HOME/.quartus_path" ]] && source ~/.quartus_path
[[ -e "$HOME/.zshrc.custom" ]] && source ~/.zshrc.custom
[[ -e "$HOME/.minttycolorrc" ]] && source ~/.minttycolorrc

# add_to_path -r "/home/mark/vdent/bin"

bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

export rvmsudo_secure_path=0
[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"

[[ -e "$HOME/.zshrc.local" ]] && source ~/.zshrc.local

# antigen theme kugurst/oh-my-zsh themes/funky
# antigen apply
