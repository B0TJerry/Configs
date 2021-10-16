function compdwm --wraps='cd ~/suckless/dwm/ && rm config.h && make && sudo make install' --wraps='cd ~/.config/suckless/dwm/ && rm config.h && make && sudo make install' --description 'alias compdwm cd ~/.config/suckless/dwm/ && rm config.h && make && sudo make install'
  cd ~/.config/suckless/dwm/ && rm config.h && make && sudo make install $argv; 
end
