# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export XDG_CONFIG_HOME=~/.config
export DISABLE_AUTO_TITLE=true
export TMUXP_CONFIGDIR=~/.tmuxp
export TERM_ITALICS=true
export DOCKER_BUILDKIT=true
export ZSH_DISABLE_COMPFIX=true

# export EVENT_NOKQUEUE=1

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# export RBENV_ROOT='/usr/local/opt/rbenv'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ERL_AFLAGS="-kernel shell_history enabled"

export BAT_THEME=Nord


# autojump #Duh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Other

export EDITOR='nvim'

plugins=(brew git github kubectl git-open terraform npm bundler macos gem rails mix extract)

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=030'
source $(brew --prefix asdf)/asdf.sh

if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH"

    autoload -Uz compinit
    compinit
  fi

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# gnu coreutils
# export PATH="/usr/local/share/istio/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/share/istio/bin:/usr/local/sbin:$HOME/go/bin:$PATH"
export PATH="$PATH:$(yarn global bin)"

# # dircolors
eval "$(dircolors ~/.dir_colors)"

bindkey -e

# beginning/end of line/word navigation
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# make ctrl p work like up arrow
bindkey "^p" up-line-or-search
bindkey "^n" down-line-or-search

# tmux
# Fix reattach for tmux
# setopt HUP

# if [ ${TMUX} ]; then # fixes paste fuckup in some cases
#   unset zle_bracketed_paste
# fi

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

eval $(thefuck --alias)
eval "$(direnv hook zsh)"
eval "$(hub alias -s)"
eval "$(starship init zsh)"
eval "$(gh completion -s zsh)"

# Created by `userpath` on 2020-02-22 15:02:05
export PATH="$PATH:/Users/alsc/.local/bin"

source $ZSH/oh-my-zsh.sh

# FZF (has to come after oh-my-zsh)

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
--info=inline
--color=dark
--color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
--color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
--color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac,border:#eacb8a
--color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b
"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

source <(stern --completion=zsh)

eval "$(aws-vault --completion-script-zsh)"
# aliases
source "$HOME/.zsh_aliases"

# syntax highlights
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /Users/alsc/.config/broot/launcher/bash/br

# zprof

alias luamake=/Users/alsc/projects/lua-language-server/3rd/luamake/luamake
