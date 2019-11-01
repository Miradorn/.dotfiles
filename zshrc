# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export XDG_CONFIG_HOME=~/.config
export DISABLE_AUTO_TITLE=true
export TMUXP_CONFIGDIR=~/.tmuxp

# export EVENT_NOKQUEUE=1

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# export RBENV_ROOT='/usr/local/opt/rbenv'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH_THEME="spaceship"
export SPACESHIP_CHAR_SYMBOL='λ '
# export SPACESHIP_CHAR_SUFFIX=' '
# export SPACESHIP_PROMPT_DEFAULT_PREFIX=''
export SPACESHIP_TIME_SHOW=true
export SPACESHIP_PACKAGE_SHOW=false
# export SPACESHIP_DOCKER_PREFIX=''
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_ELIXIR_SHOW=false
export SPACESHIP_KUBECONTEXT_SYMBOL="☸️"
export SPACESHIP_TERRAFORM_SHOW=true
export SPACESHIP_TERRAFORM_SYMBOL="🛠️"

export ERL_AFLAGS="-kernel shell_history enabled"

export BAT_THEME=OneHalfDark

eval "$(hub alias -s)"
# eval "$(rbenv init -)"

eval $(thefuck --alias)

# autojump #Duh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Other

export EDITOR='nvim'

plugins=(git colored-man-pages docker terraform yarn kubectl helm bundler osx brew gem rails mix sdk extract)

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=030'
source /usr/local/opt/asdf/asdf.sh

source $ZSH/oh-my-zsh.sh
#
# completion setup

fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

complete -o nospace -C /usr/local/bin/vault vault

# gcloud
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

source /usr/local/etc/bash_completion.d/asdf.bash
source <(stern --completion=zsh)
source <(velero completion zsh)

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# gnu coreutils
# export PATH="/usr/local/share/istio/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/share/istio/bin:/usr/local/sbin:$PATH"

# # dircolors
eval "$(dircolors ~/.dir_colors)"

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


export FZF_DEFAULT_OPTS="
--height 40% --border
--color=dark
--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# tmux
# Fix reattach for tmux
setopt HUP

if [ ${TMUX} ]; then # fixes paste fuckup in some cases
  unset zle_bracketed_paste
fi

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval $(thefuck --alias)
eval "$(direnv hook zsh)"
