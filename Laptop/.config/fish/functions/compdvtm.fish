function compdvtm --wraps='cd ~/.config/suckless/dvtm && rm config.h && make && sudo make install' --description 'alias compdvtm cd ~/.config/suckless/dvtm && rm config.h && make && sudo make install'
  cd ~/.config/suckless/dvtm && rm config.h && make && sudo make install $argv; 
end
