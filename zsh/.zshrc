export TERM="xterm-256color"

#Mac jump words
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/opt/python/libexec/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/danielkorn/.oh-my-zsh

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_INSTALLATION_PATH="/Users/danielkorn/.oh-my-zsh/custom/themes/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, fzf-zsh, kubectl, zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias pipeline="tmuxp load pipeline"
alias bp_mikud="echo 6721707"
alias docker_restart="osascript -e 'quit app \"Docker\"' && open -a Docker"
alias mongobp="mongo bigpanda-data-api"
alias npmi="noti npm install"
alias k="kubectl"
alias git="hub"
alias restart="sudo shutdown -r now"
alias shutdown="sudo shutdown -h now"
alias sleep="sudo shutdown -s now"
alias zoom="echo https://bigpanda.zoom.us/my/dkorn"
export BIGPANDADIR="/Users/danielkorn/git/bigpanda"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export DISABLE_AUTO_TITLE='true'

precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# view man pages in Preview
# pman() { ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ; }
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/local/etc/profile.d/z.sh
source ~/.nvm/nvm.sh
source ~/.secrets

export PATH="$PATH:$HOME/.rvm/bin"

# added by travis gem
[ -f /Users/danielkorn/.travis/travis.sh ] && source /Users/danielkorn/.travis/travis.sh
