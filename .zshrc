zstyle ':completion:*:ssh:*' hosts off

ZSH_THEME=""

plugins=(git sudo httpie fasd zsh-completions zsh-cargo-completion)

export LC_ALL=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export GDFUSE="$HOME/.gdfuse/default"
export DEV="$HOME/Sync/Dev"
export VISUAL="vim"
export EDITOR="vim"

source $ZSH/oh-my-zsh.sh
source $HOME/.alias
source $HOME/.funcs
source $HOME/.path

# Set IM to fcitx
export XIM_PROGRAM=fcitx
export XIM=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export QT_AUTO_SCREEN_SCALE_FACTOR=true

# Start wal background
([[ -f ~/.cache/wal ]] && cat ~/.cache/wal/sequences &)  

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files. Makes repository status check faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder xhan $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export OPENSSL_LIBS="-L/usr/local/Cellar/openssl@1.1/1.1.1d/lib"
export OPENSSL_CFLAGS="-I/usr/local/Cellar/openssl@1.1/1.1.1d/include"

autoload -U compinit && compinit
autoload -U promptinit && promptinit

stty icrnl
prompt spaceship

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null


# opam configuration
[[ ! -r /home/pop/.opam/opam-init/init.zsh ]] || source /home/pop/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# bitwarden auto complete
eval "$(bw completion --shell zsh); compdef _bw bw;"


#############################################################################
# Start of hygeia config block.
# These lines were added by hygeia and are required for it to function
# properly (including the comments!)
# See https://github.com/nbigaouette/hygeia
# WARNING: Those lines _need_ to be at the end of the file: hygeia needs to
#          appear as soon as possible in the $PATH environment variable to
#          to function properly.
export HYGEIA_HOME="$HOME/.hygeia"
source ${HYGEIA_HOME}/shell/zsh/config.sh
# End of hygeia config block.
#############################################################################

PATH="/Users/pop/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/pop/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/pop/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/pop/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/pop/perl5"; export PERL_MM_OPT;
