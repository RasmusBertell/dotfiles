# XDG specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# History
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export HISTSIZE=2147483647
export SAVEHIST=2147483647

# Programs
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/config"
export TASKRC="$XDG_CONFIG_HOME/task/config"
export TASKDATA="$XDG_DATA_HOME/task"
export TIMEWARRIORDB="$XDG_DATA_HOME/timew"
export ZPLUG_HOME="$XDG_DATA_HOME/zsh/zplug"
export CARGO_HOME="$XDG_DATA_HOME/cargo"