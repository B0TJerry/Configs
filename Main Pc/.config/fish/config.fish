if status is-interactive
    # Commands to run in interactive sessions can go here
    pfetch
set -gx BROWSER "firefox"
set -gx EDITOR "nvim"

set -gx NNN_FIFO "/tmp/nnn.fifo"

set -gx PAGER "bat"

set -gx NNN_TMPFILE "/tmp/nnn"

#NNN settings using environment variables
set -gx NNN_PLUG "f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;l:preview-tui;i:imgview"
set -gx BLK "04"
set -gx CHR "04"
set -gx DIR "04"
set -gx EXE "00"
set -gx REG "00"
set -gx HARDLINK "00"
set -gx SYMLINK "06"
set -gx MISSING "00"
set -gx ORPHAN "01"
set -gx FIFO "0F"
set -gx SOCK "0F"
set -gx OTHER "02"
set -gx NNN_FCOLORS "$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold red
      echo "|Nrm|"
    case insert
      set_color --bold green
      echo "|Ins|"
    case replace_one
      set_color --bold green
      echo "|Rep|"
    case visual
      set_color --bold brmagenta
      echo "|Vis|"
    case '*'
      set_color --bold red
      echo "|?|"
  end
  set_color normal
end


#Changes Default keybindings to vi keybindings
set -g fish_key_bindings fish_vi_key_bindings

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block

# Set the insert mode cursor to a line
set fish_cursor_insert line

# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore

# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block
 
end
#set -gx MANPAGER "less --wheel-line=4 --mouse --use-color -dd+b -du+g -de+r -ds+ky -j -n -m"
