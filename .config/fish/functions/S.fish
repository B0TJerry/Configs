function S --wraps='doas pacman -S' --description 'alias S doas pacman -S'
  doas pacman -S $argv; 
end
