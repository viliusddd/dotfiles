# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/vil/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
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
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

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
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# remove capsLock delay
# sudo chmod +x Documents/scripts/Linux-CapsLock-Delay-Fixer/bootstrap.sh
# ./Documents/scripts/Linux-CapsLock-Delay-Fixer/bootstrap.sh

# caps to ctrl/esc
setxkbmap -layout us -option ctrl:nocaps
xcape -e 'Control_L=Escape'

# disable arrow keys and PgUp, PgDn
#xmodmap -e "keycode 111 ="
#xmodmap -e "keycode 113 ="
#xmodmap -e "keycode 112 ="
#xmodmap -e "keycode 114 ="
#xmodmap -e "keycode 116 ="
#xmodmap -e "keycode 117 ="

# enable terminal vim mode
set -o vi

# execute scripts
# exec /home/vil/Documents/scripts/i3-layout-manager/layout_manager.sh

# diable touchpad
xinput --disable 'SynPS/2 Synaptics TouchPad'
# diable touchscreen
xinput --disable 'Raydium Corporation Raydium Touch System'

# disable Ctrl+s so it won't freeze terminal or vim accidentaly
stty -ixon

# fix audio not playing problem
amixer -q set Headphone 100% unmute

# mount Windows drives from /etc/fstab
# sudo mount -a

# start screenshot app
# flameshot

# include wakatime
source ~/git/bash-wakatime/bash-wakatime.sh

# setup external monitor
xrandr --auto
xrandr --output HDMI-1 --above eDP-1
alias config='/usr/bin/git --git-dir=/home/vil/.cfg/ --work-tree=/home/vil'
alias config='/usr/bin/git --git-dir=/home/vil/.cfg/ --work-tree=/home/vil'

# vim mode
bindkey -v

export KEYTIMEOUT=1

alias vi=nvim
alias notion=/home/vil/github/lotion/Notion/notion
export PATH=$PATH:/home/vil/cgt/wildcat-scripts
export PATH=$PATH:/home/vil/github/todo
export PATH=$PATH:/opt/Thinkbox/Deadline10/bin

# zle -N zle-line-init
# zle -N zle-keymap-select

# Dependencies for the following lines
# zmodload zsh/zle
# autoload -U colors && colors

# Change prompt icon + color based on insert/normal vim mode in prompt
# Will have no effect if you don't use pure as your ZSH theme
# export PURE_PROMPT_SYMBOL="[I] ❯"
# export PURE_PROMPT_VICMD_SYMBOL="%{$fg[green]%}[N] ❮%{$reset_color%}"

# By default, we have insert mode shown on right hand side
# export RPROMPT="%{$fg[blue]%}[INSERT]%{$reset_color%}"

# And also a beam as the cursor
echo -ne '\e[5 q'

# Callback for vim mode change
function zle-keymap-select () {
    # Only supported in these terminals
    if [ "$TERM" = "xterm-256color" ] || [ "$TERM" = "xterm-kitty" ] || [ "$TERM" = "screen-256color" ]; then
        if [ $KEYMAP = vicmd ]; then
            # Command mode
            export RPROMPT="%{$fg[green]%}[NORMAL]%{$reset_color%}"

            # Set block cursor
            echo -ne '\e[1 q'
        else
            # Insert mode
            export RPROMPT="%{$fg[blue]%}[INSERT]%{$reset_color%}"

            # Set beam cursor
            echo -ne '\e[5 q'
        fi
    fi

    if typeset -f prompt_pure_update_vim_prompt_widget > /dev/null; then
        # Refresh prompt and call Pure super function
        prompt_pure_update_vim_prompt_widget
    fi
}

# Bind the callback
zle -N zle-keymap-select

# Restore some keymaps removed by vim keybind mode
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# git add, commit and push in a single sweep
function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}
