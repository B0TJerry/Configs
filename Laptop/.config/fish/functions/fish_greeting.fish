function fish_greeting
pfetch
    echo Welcome to The (set_color red; echo "Friendly"; set_color blue; echo "Interactive"; set_color green; echo "SHell."; set_color normal) 
    echo The date and time are (set_color yellow; echo "|" ;date +%D; echo "|";date +%r; echo "|"; set_color normal)
    echo and Today is (set_color yellow; date +%A.)
end
