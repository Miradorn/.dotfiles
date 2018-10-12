# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export XDG_CONFIG_HOME=~/.config
export DISABLE_AUTO_TITLE=true

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
export SPACESHIP_PACKAGE_SHOW=true
# export SPACESHIP_DOCKER_PREFIX=''
export SPACESHIP_ELIXIR_SHOW=false

export ERL_AFLAGS="-kernel shell_history enabled"

eval "$(hub alias -s)"
eval "$(rbenv init -)"

# autojump #Duh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Other

export EDITOR='nvim'

plugins=(asdf git docker yarn kubectl helm bundler osx brew brew-cask gem rails mix)

# completion setup

fpath=(/usr/local/share/zsh-completions $fpath)

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=030'

source $ZSH/oh-my-zsh.sh

# gcloud
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'


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

_gen_fzf_default_opts() {

  local color00='#282828'
  local color01='#f43753'
  local color02='#c9d05c'
  local color03='#ffc24b'
  local color04='#b3deef'
  local color05='#d3b987'
  local color06='#73cef4'
  local color07='#eeeeee'
  local color08='#1d1d1d'
  local color09='#f43753'
  local color0A='#c9d05c'
  local color0B='#ffc24b'
  local color0C='#b3deef'
  local color0D='#d3b987'
  local color0E='#73cef4'
  local color0F='#ffffff'

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
###-begin-graphql-completions-###
#
# yargs command completion script
#
# Installation: /usr/local/bin/graphql completion >> ~/.bashrc
#    or /usr/local/bin/graphql completion >> ~/.bash_profile on OSX.
#
# _yargs_completions()
# {
#     local cur_word args type_list

#     cur_word="${COMP_WORDS[COMP_CWORD]}"
#     args=("${COMP_WORDS[@]}")

#     # ask yargs to generate completions.
#     type_list=$(/usr/local/bin/graphql --get-yargs-completions "${args[@]}")

#     COMPREPLY=( $(compgen -W "${type_list}" -- ${cur_word}) )

#     # if no match was found, fall back to filename completion
#     if [ ${#COMPREPLY[@]} -eq 0 ]; then
#       COMPREPLY=( $(compgen -f -- "${cur_word}" ) )
#     fi

#     return 0
# }
# complete -F _yargs_completions graphql
###-end-graphql-completions-###

