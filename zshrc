 # zmodload zsh/zprof
export SHELL=/opt/homebrew/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export XDG_CONFIG_HOME=~/.config
export DISABLE_AUTO_TITLE=true
export TMUXP_CONFIGDIR=~/.tmuxp
export TERM_ITALICS=true
export DOCKER_BUILDKIT=true
export ZSH_DISABLE_COMPFIX=true

export GPG_TTY=$(tty)

# export EVENT_NOKQUEUE=1

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ERL_AFLAGS="-kernel shell_history enabled"

export DIRENV_LOG_FORMAT=

# autojump #Duh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# Other

export EDITOR='nvim'
# export MISE_ASDF_COMPAT=1

eval "$(mise activate zsh)"

# see https://github.com/jdx/mise/issues/3099
export MISE_LIBGIT2=false

eval "$(/opt/homebrew/bin/brew shellenv)"
plugins=(git git-open npm macos mix mix-fast extract kubectl gh)

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=030'

export PATH="$PATH:$(yarn global bin)"

bindkey -e

# beginning/end of line/word navigation
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# make ctrl p work like up arrow
bindkey "^p" up-line-or-search
bindkey "^n" down-line-or-search

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
eval "$(starship init zsh)"

# Created by `userpath` on 2020-02-22 15:02:05
export PATH="$PATH:/Users/$(whoami)/.local/bin"

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH"
  fi

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
--color=fg:#c8d3f5,bg:#222436,hl:#ff966c \
--color=fg+:#c8d3f5,bg+:#2f334d,hl+:#ff966c \
--color=info:#82aaff,prompt:#86e1fc,pointer:#86e1fc \
--color=marker:#c3e88d,spinner:#c3e88d,header:#c3e88d"

# catpuccin
# --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
# --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
# --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

source <(stern --completion=zsh)

export AWS_SESSION_TOKEN_TTL=8h
export AWS_ASSUME_ROLE_TTL=8h
export AWS_FEDERATION_TOKEN_TTL=8h
export AWS_PROFILE=sts

eval "$(aws-vault --completion-script-zsh)"
# aliases
source "$HOME/.zsh_aliases"

# syntax highlights
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


source /Users/$(whoami)/.config/broot/launcher/bash/br

# erlang stuff
export KERL_BUILD_DOCS=yes
# export KERL_CONFIGURE_OPTIONS="
#       --disable-silent-rules \
#       --enable-dynamic-ssl-lib \
#       --enable-hipe \
#       --enable-shared-zlib \
#       --enable-smp-support \
#       --enable-threads \
#       --enable-wx \
#       --with-ssl=$(brew --prefix openssl@1.1) \
#       --without-javac
#       --enable-darwin-64bit \
#       --enable-kernel-poll \
#       --with-dynamic-trace=dtrace \
#      "


export POSTGRES_EXTRA_CONFIGURE_OPTIONS="--with-lz4 --with-uuid=e2fs"

# remotectl
compdef remotectl
compdef _remotectl remotectl
source <(remotectl completion zsh)
#
# zprof

source /Users/alexander/.config/broot/launcher/bash/br
