function compdmenu --wraps='cd ~/suckless/dmenu/ && rm config.h && make && sudo make install && cd' --description 'alias compdmenu cd ~/suckless/dmenu/ && rm config.h && make && sudo make install && cd'
  cd ~/suckless/dmenu/ && rm config.h && make && sudo make install && cd $argv; 
end
