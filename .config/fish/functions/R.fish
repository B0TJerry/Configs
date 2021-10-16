function R --wraps='doas pacman -Rs' --description 'alias R doas pacman -Rs'
  doas pacman -Rs $argv; 
end
