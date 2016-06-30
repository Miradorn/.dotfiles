# Path to your oh-my-zsh installation.
export ZSH=/Users/Alex/.oh-my-zsh

export TERM="xterm-256color"
export TERMINFO="$HOME/.terminfo"

export XDG_CONFIG_HOME=~/.config
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOCONNECT=false

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export RBENV_ROOT='/usr/local/opt/rbenv'

ZSH_THEME="spaceship"
export SPACESHIP_PROMPT_SYMBOL=λ
export SPACESHIP_NVM_SHOW=false
export SPACESHIP_VENV_SHOW=false

eval "$(hub alias -s)"
eval "$(rbenv init -)"
eval $(thefuck --alias)

# Other
# skip_global_compinit=1

# [[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
export EDITOR='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

plugins=(autojump git bundler osx rake ruby brew brew-cask tmux gem rails mix elixir ember-cli zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin

eval "$(dircolors)"
alias l="ls -lah --color"
alias ta="tmux attach -d -t"

alias vi='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

setopt HUP
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# OPAM configuration
#. /Users/Alex/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
if [ ${TMUX} ]; then
 unset zle_bracketed_paste
fi
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
