if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

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

#function fish_right_prompt -d "Write out the right prompt"
#    echo '|'
#    date '+%S'
#    echo '|'
#end

#set -gx PAGER 'less --wheel-lines=4 --mouse --use-color -Dd+b -Du+g -DE+r -DS+ky -J -N -M'

set -gx PAGER "bat --style=plain"
set -Ux EDITOR "nvim"

# NNN settings
set -gx NNN_TMPFILE "/tmp/nnn"
set -gx NNN_FIFO "/tmp/nnn.fifo"
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


