zstyle ':completion:*:ssh:*' hosts off

ZSH_THEME="cypher"

plugins=(git sudo fasd)

autoload -U compinit && compinit

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export VISUAL="vim"
export EDITOR="vim"

# Scripts to run
source $ZSH/oh-my-zsh.sh
source $HOME/.alias
source $HOME/.funcs
source $HOME/.path

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

