loadAntigen() {
  source ~/antigen.zsh

  antigen use oh-my-zsh

  antigen bundle git
  antigen bundle rust
  antigen bundle sudo
  antigen bundle fasd
  antigen bundle docker

  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-completions
  antigen bundle MenkeTechnologies/zsh-cargo-completion
  antigen bundle mroth/evalcache
  antigen bundle HeroesLament/zsh-tailscale-plugin@main

  antigen theme spaceship-prompt/spaceship-prompt

  antigen apply
}

loadAntigen >> $HOME/.local/log/loadAntigen.log 2>&1
# loadAntigen

export LC_ALL=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export GDFUSE="$HOME/.gdfuse/default"
export DEV="$HOME/Dev"
export ACA="$HOME/Sync/Academy"
export VISUAL="vim"
export EDITOR="vim"
export HISTFILE="$HOME/.zsh_history"
export NPM_PACKAGES="${HOME}/.npm-packages"

source $HOME/.alias
source $HOME/.funcs
source $HOME/.path

zstyle ':completion:*:ssh:*' hosts off

xset > /dev/null 2>&1 && xset r rate 150 30

# Disable colors in ls.
DISABLE_LS_COLORS="true"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files. Makes repository status check faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

autoload -Uz promptinit && promptinit

stty icrnl

unset SSH_AGENT_PID
if exists gpgconf && exists gpg-connect-agent; then
  start_gpg
else
  echo "gpgconf and/or gpg-connect-agent not loaded yet, manual call `start_gpg` later"
fi

source "$(redo alias-file)"

# bitwarden auto complete
_evalcache bw completion --shell zsh; compdef _bw bw

#############################################################################
# Start of hygeia config block.
# These lines were added by hygeia and are required for it to function
# properly (including the comments!)
# See https://github.com/nbigaouette/hygeia
# WARNING: Those lines _need_ to be at the end of the file: hygeia needs to
#          appear as soon as possible in the $PATH environment variable to
#          to function properly.
export HYGEIA_HOME="$HOME/.hygeia"
_evalcache cat ${HYGEIA_HOME}/shell/zsh/config.sh
# End of hygeia config block.
#############################################################################

# opam configuration
[[ ! -r /Users/pop/.opam/opam-init/init.zsh ]] || source /Users/pop/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# GHCup configuration
[ -f "/home/pop/.ghcup/env" ] && source "/home/pop/.ghcup/env" # ghcup-env
