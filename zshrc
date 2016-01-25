# Path to your oh-my-zsh installation.
export ZSH=/Users/Alex/.oh-my-zsh

export XDG_CONFIG_HOME=~/.config
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false

# Powerline Theme

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time battery background_jobs rbenv)

POWERLEVEL9K_MODE='awesome-patched'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%F{249}%}\u2517%{%F{default}%} "


POWERLEVEL9K_TIME_FORMAT='%D{%H:%M} \UE12E'

# GitHub

eval "$(hub alias -s)"

# Other

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
#eval "$(thefuck --alias)"
export EDITOR=vim

alias vi=vim

plugins=(git bundler osx rake ruby brew tmux mvn rbenv gem thefuck vagrant)

source $ZSH/oh-my-zsh.sh

export RBENV_VERSION=$(rbenv global)

alias l="ls -lFah"

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
