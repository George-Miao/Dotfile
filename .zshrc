# Scripts to run
source $HOME/.alias
source $HOME/.funcs
source $HOME/.path

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export GDFUSE="$HOME/.gdfuse/default"
export DEV="$HOME/Dropbox/Dev"
export VISUAL="vim"
export EDITOR="vim"

# Set IM to fcitx
export XIM_PROGRAM=fcitx
export XIM=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export QT_AUTO_SCREEN_SCALE_FACTOR=true

# Start wal background
(cat ~/.cache/wal/sequences &)  

# Eval bitwarden autocompletion
eval $(bw completion --shell zsh)

# CXX configs
# export LD_LIBRARY_PATH=/prod/lib:/prod/lib64
# export LIBRARY_PATH=/prod/lib:/prod/lib64
# export CDPATH=.:/prod/:/prod/projects/:$CDPATH
# export CC=/prod/bin/gcc
# export CXX=/prod/bin/g++
# export CMAKE_C_COMPILER=/prod/bin/gcc
# export CMAKE_CXX_COMPILER=/prod/bin/g++
# export CPPFLAGS="-I/prod/include"
# export LDFLAGS="-L/prod/lib"

ZSH_THEME="robbyrussell"

plugins=(git sudo httpie fasd zsh-completions)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files. Makes repository status check faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Git ignore
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# fauna autocomplete setup
FAUNA_AC_ZSH_SETUP_PATH=/home/pop/.cache/fauna-shell/autocomplete/zsh_setup && test -f $FAUNA_AC_ZSH_SETUP_PATH && source $FAUNA_AC_ZSH_SETUP_PATH;

stty icrnl

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null


#############################################################################
# Start of hygeia config block.
# These lines were added by hygeia and are required for it to function
# properly (including the comments!)
# See https://github.com/nbigaouette/hygeia
# WARNING: Those lines _need_ to be at the end of the file: hygeia needs to
#          appear as soon as possible in the $PATH environment variable to
#          to function properly.
export HYGEIA_HOME="/home/pop/.hygeia"
source "${HYGEIA_HOME}/shell/zsh/config.sh"
# End of hygeia config block.
#############################################################################
