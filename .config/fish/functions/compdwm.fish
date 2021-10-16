function compdwm --wraps='cd ~/.config/suckless/dwm/ && rm config.h && make && sudo make install' --wraps='cd ~/.config/suckless/dwm/ && rm config.h && make && sudo make install && cd ~/' --description 'alias compdwm cd ~/.config/suckless/dwm/ && rm config.h && make && sudo make install && cd ~/'
  cd ~/.config/suckless/dwm/ && rm config.h && make && sudo make install && cd ~/ $argv; 
end
