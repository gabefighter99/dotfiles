# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# disable oh-my-zsh themes for pure prompt
ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh
# export ZPLUG_HOME=/opt/homebrew/opt/zplug
# source $ZPLUG_HOME/init.zsh

# zplug "mafredri/zsh-async", from:github
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
# zplug load

# Install plugins if there are plugins that have not been installed
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi

source <(kubectl completion zsh)
eval "$(pyenv init --path)"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	autojump
	fzf
	zsh-autosuggestions
	zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

echo ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=\'fg=60\' >> $ZSH_CUSTOM/zsh-autosuggestions_custom.zsh

unsetopt inc_append_history
unsetopt share_history

__git_files () {
    _wanted files expl 'local files' _files
}
# User configuration

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias c='clear'
alias ls.='ls -la'
alias ..='cd ..'
alias count='find . -type f | wc -l'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# echo -e "`date +"%Y-%m-%d %H:%M:%S"` direnv hooking zsh"
eval "$(direnv hook zsh)"

# PATH edits
export PATH="$PATH:/Users/gabe.petrov/bin"

# JDK
unset JAVA_HOME
export JAVA8_HOME="$(/usr/libexec/java_home -v1.8)"
export JAVA11_HOME="$(/usr/libexec/java_home -v11)"
alias jdk_11='export JAVA_HOME="$JAVA11_HOME" && export PATH="$JAVA_HOME/bin:$PATH"'
alias jdk_8='export JAVA_HOME="$JAVA8_HOME" && export PATH="$JAVA_HOME/bin:$PATH"'
jdk_11 # Use jdk 11 as the default jdk

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
alias vim=nvim
eval "$(gh copilot alias -- zsh)"
