# Path to your oh-my-zsh installation.
export ZSH=/Users/Alex/.oh-my-zsh

export TERM="xterm-256color"

export XDG_CONFIG_HOME=~/.config
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOCONNECT=false

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

ZSH_THEME="af-magic"

eval "$(hub alias -s)"

# Other

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
#eval "$(thefuck --alias)"
export EDITOR=vim

plugins=(git bundler osx rake ruby brew brew-cask tmux rbenv gem rails mix elixir ember-cli thefuck zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin

eval "$(dircolors)"
alias l="ls -lah --color"
alias ta="tmux attach -d -t"

alias vi='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

setopt HUP

# OPAM configuration
#. /Users/Alex/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
