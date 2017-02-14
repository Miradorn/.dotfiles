# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# export TERM="xterm-256color"

export XDG_CONFIG_HOME=~/.config
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOCONNECT=false

export EVENT_NOKQUEUE=1

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export RBENV_ROOT='/usr/local/opt/rbenv'

ZSH_THEME="spaceship"
export SPACESHIP_PROMPT_SYMBOL=λ
export SPACESHIP_NVM_SHOW=false
export SPACESHIP_VENV_SHOW=false

eval "$(hub alias -s)"
eval "$(rbenv init -)"
# eval $(thefuck --alias)

# autojump #Duh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Other

export EDITOR='nvim'

plugins=(npm git docker bundler osx rake ruby brew brew-cask tmux gem rails mix elixir ember-cli zsh-autosuggestions zsh-completions)

# completion setup

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/Cellar/node/7.3.0/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:$PATH"

eval "$(dircolors)"
alias l="ls -lah --color"
alias ls='gls --color=tty'
alias ta="tmux attach -d -t"

alias vi=nvim
alias vim=nvim
alias pryr="pry -r ./config/environment"

# FZF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40%'


setopt HUP # Fix reattach for tmux

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

