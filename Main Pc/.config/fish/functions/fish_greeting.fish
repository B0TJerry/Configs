function fish_greeting
    echo Welcome to the (set_color red; echo "Friendly"; set_color green; echo "Interactive"; set_color blue; echo "SHell."; set_color normal)
    echo The Time and Date are (set_color yellow; echo "|";date +%r; echo "|"; date +%D; ) "|" (set_color normal)
    echo And Today is (set_color yellow; date +%A; set_color normal)
end

