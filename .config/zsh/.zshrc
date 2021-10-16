# Run pfetch when a new instance is opened
pfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#change zsh prompt to powerlevel10k
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

bindkey '^[[Z' reverse-menu-complete

#zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

#Include the directory in your $fpath
#fpath=(~/.config/zsh/zsh/zsh-completions)

#zsh auto-suggestions 
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'

## zsh autocompletions
#source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
ENABLE_CORRECTION="true"
#source ~/.config/zsh/autoset.zsh


#zsh syntax highlighting
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#Better Zsh Vi mode
source ~/.config/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# History
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

setopt autocd extendedglob
unsetopt beep nomatch

# Vim keybinds
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jy/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# basic auto/tab complete:
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -U compinit
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Aliases
alias exa="exa --icons --all --grid"
alias ls="exa"
alias e="emacs"
alias et="emacs -nw"
alias c="clear"
alias S="doas pacman -S"
alias Syu="doas pacman -Syu"
alias R="doas pacman -Rs"
alias smi="rm config.h && doas make clean install"
alias cnp="g++ badcalc.cpp -o badcalc && ./badcalc"
alias ytdl="youtube-dl"
alias ..="cd .."
alias ...="cd ..."
alias cp="/usr/local/bin/cpg -g"
alias mv="/usr/local/bin/mvg -g"
alias bat="bat -A -f"
alias nc="ncmpcpp"
alias nv="nvim"
alias irssi="irssi --connect=irc.libera.chat"
alias cd..="cd .."
alias lynx="lynx -use_mouse"
# NNN settings 
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;l:preview-tui;i:imgview'
BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
alias nnn="nnn -r -a -H -P l"
# Cd on quit for the NNN file manager
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}


#changes the default editor
export EDITOR='nvim'
export VISUAL='nvim'

#changes the manpager
export MANPAGER='less --wheel-lines=4 --mouse --use-color -Dd+b -Du+g -DE+r -DS+ky -J -N -M'


