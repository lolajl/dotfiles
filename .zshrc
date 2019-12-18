
#===========================================

# shell environment configuration 
# created by lolajl 11//2019
#
# modified 12/4/2019
# added aliases   

#===========================================


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="/usr/local/mysql/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/ljleebeno/.oh-my-zsh"

#set virtualenv to false so I can get pip to install shit
export PIP_REQUIRE_VIRTUALENV=false

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# original  ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
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
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
	git
	history
	last-working-dir
	osx
	sudo
	z
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Aliases

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias jlab="jupyter lab"
alias topten="history | commands | sort -rn | head"
alias myip="curl http://ipecho.net/plain; echo"
alias opengtt="wine ~/Documents/Weaving/GTT/GTT.exe"
alias rmlock="rm /Users/lolajl/.cpan/.lock"
alias sourcream="source ~/.zshrc"
alias weather="curl http://wttr.in/"

# mysql aliases
alias mysql="/usr/local/mysql/bin/mysql"
alias mysqladmin="/usr/local/mysql/bin/mysqladmin"
alias startmysql="mysql -u lola -p"
alias mysql.start="sudo /usr/local/mysql/support-files/mysql.server start"
alias mysql.stop="sudo /usr/local/mysql/support-files/mysql.server stop"
alias mysql.restart="sudo /usr/local/mysql/support-files/mysql.server restart"
alias mysql.status="sudo /usr/local/mysql/support-files/mysql.server status"

# apache aliases
alias startapache="sudo apachectl start"
alias stopapache="sudo apachectl start"
alias restarta="sudo apachectl restart"

# set python environment

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
	
#
# Create a new directory and cd into it
# Similar to "mkdir xxx && cd $_"
#
mkcd () {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash

#  It turns ^Z into a toggle. It’s like magic.
#  Editing in vim, it ^Z to get to the shall, do some stuff, hit ^Z and you’re right back in vim!

ctrlz() {
  if [[ $#BUFFER == 0 ]]; then
    fg >/dev/null 2>&1 && zle redisplay
  else
    zle push-input
  fi
}
zle -N ctrlz
bindkey '^Z' ctrlz

	
