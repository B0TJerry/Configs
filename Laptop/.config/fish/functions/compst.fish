function compst --wraps='cd ~/.config/suckless/st && rm config.h && make && sudo make install' --description 'alias compst cd ~/.config/suckless/st && rm config.h && make && sudo make install'
  cd ~/.config/suckless/st && rm config.h && make && sudo make install $argv; 
end
