# Path & aliases
source "$ZDOTDIR/.zpath"
source "$ZDOTDIR/.zalias"

# Prompt
setopt PROMPT_SUBST
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' menu select=0
autoload -Uz compinit
compinit

# History
setopt INC_APPEND_HISTORY_TIME
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY

j ()
{
    cd $(fd . ~ --type d | fzf --preview 'tree -CF -L 2 {+1}')
}

# Starship prompt
eval "$(starship init zsh)"
