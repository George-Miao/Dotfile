# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

NPM_PACKAGES="${HOME}/.npm-packages"

# Set Path and Manpath
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH:$HOME/.cargo/bin:$NPM_PACKAGES/bin:$HOME/go/bin:$HOME/.local/bin:/usr/local/go/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Set IM to fcitx
export XIM_PROGRAM=fcitx
export XIM=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export QT_DEVICE_PIXEL_RATIO=2
export QT_AUTO_SCREEN_SCALE_FACTOR=true

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

# Path to your oh-my-zsh installation.
export ZSH="/home/pop/.oh-my-zsh"
export GDFUSE="/home/pop/.gdfuse/default"
export DEV="$HOME/Dropbox/Dev"
export VISUAL="vim"
export EDITOR="vim"

ZSH_THEME="robbyrussell"

plugins=(git sudo httpie fasd zsh-completions)

autoload -U compinit && compinit

# Scripts to run
source $HOME/.alias

eval `dircolors $HOME/.dir_colors`

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# If proxy is needed
# source $HOME/proxy.sh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
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

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Git ignore
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# fauna autocomplete setup
FAUNA_AC_ZSH_SETUP_PATH=/home/pop/.cache/fauna-shell/autocomplete/zsh_setup && test -f $FAUNA_AC_ZSH_SETUP_PATH && source $FAUNA_AC_ZSH_SETUP_PATH;
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

stty icrnl

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

source ~/.alias
source ~/.funcs
