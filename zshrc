# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export XDG_CONFIG_HOME=~/.config
export DISABLE_AUTO_TITLE=true
export TMUXP_CONFIGDIR=~/.tmuxp

# export EVENT_NOKQUEUE=1

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export RBENV_ROOT='/usr/local/opt/rbenv'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH_THEME="spaceship"
export SPACESHIP_CHAR_SYMBOL='λ '
# export SPACESHIP_CHAR_SUFFIX=' '
# export SPACESHIP_PROMPT_DEFAULT_PREFIX=''
export SPACESHIP_TIME_SHOW=true
export SPACESHIP_PACKAGE_SHOW=false
# export SPACESHIP_DOCKER_PREFIX=''
export SPACESHIP_ELIXIR_SHOW=false
export SPACESHIP_KUBECONTEXT_SYMBOL="☸️"

export ERL_AFLAGS="-kernel shell_history enabled"

export BAT_THEME=OneHalfDark

eval "$(hub alias -s)"
# eval "$(rbenv init -)"

# autojump #Duh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Other

export EDITOR='nvim'

plugins=(git docker yarn kubectl helm bundler osx brew brew-cask gem rails mix)

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=030'
source /usr/local/opt/asdf/asdf.sh

source $ZSH/oh-my-zsh.sh
#
# completion setup

fpath=(/usr/local/share/zsh-completions $fpath)

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# gcloud
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

source /usr/local/etc/bash_completion.d/asdf.bash

# gnu coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/share/istio/bin:/usr/local/sbin:$PATH"

# dircolors
eval "$(dircolors)"

# aliases
source "$HOME/.zsh_aliases"

# beginning/end of line/word navigation
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# FZF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}


_gen_fzf_default_opts() {

  local color00='#282c34'
  local color01='#e06c75'
  local color02='#98c379'
  local color03='#e5c07b'
  local color04='#61afef'
  local color05='#c678dd'
  local color06='#56b6c2'
  local color07='#dcdfe3'
  local color08='#3d4452'
  local color09='#be5046'
  local color0A='#98c379'
  local color0B='#ffdb99'
  local color0C='#61afef'
  local color0D='#eba8ff'
  local color0E='#e06c75'
  local color0F='#f7f8f9'

  export FZF_DEFAULT_OPTS="
  --height 40% --border
  --color=bg+:$color08,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  "
  export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
}

_gen_fzf_default_opts

# tmux
# Fix reattach for tmux
setopt HUP

if [ ${TMUX} ]; then # fixes paste fuckup in some cases
  unset zle_bracketed_paste
fi

# colored man pages
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
