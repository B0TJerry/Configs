function compsurf --wraps='cd ~/.config/suckless/surf/ && rm -rf config.h && make && sudo make install' --description 'alias compsurf cd ~/.config/suckless/surf/ && rm -rf config.h && make && sudo make install'
  cd ~/.config/suckless/surf/ && rm -rf config.h && make && sudo make install $argv; 
end
