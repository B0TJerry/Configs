function gcm --wraps='git commit -a' --description 'alias gcm git commit -a'
  git commit -a $argv; 
end
