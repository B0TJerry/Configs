function Syu --wraps='sudo pacman -Syu ' --description 'alias Syu=sudo pacman -Syu '
  sudo pacman -Syu  $argv; 
end
