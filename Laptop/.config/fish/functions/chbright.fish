function chbright --wraps='sudo nvim /sys/class/backlight/intel_backlight/brightness' --description 'alias chbright sudo nvim /sys/class/backlight/intel_backlight/brightness'
  sudo nvim /sys/class/backlight/intel_backlight/brightness $argv; 
end
