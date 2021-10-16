function compdmenu --wraps='cd ~/.config/suckless/dmenu/ && rm config.h && make && sudo make install && cd ~/' --description 'alias compdmenu cd ~/.config/suckless/dmenu/ && rm config.h && make && sudo make install && cd ~/'
  cd ~/.config/suckless/dmenu/ && rm config.h && make && sudo make install && cd ~/ $argv; 
end
