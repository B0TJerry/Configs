function Syu --wraps='doas pacman -Syu' --description 'alias Syu doas pacman -Syu'
  doas pacman -Syu $argv; 
end
