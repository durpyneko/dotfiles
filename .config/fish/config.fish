if status is-interactive
    # Commands to run in interactive sessions can go here
    export trash=".local/share/Trash/files/"
end

function fish_greeting
    # fortune | cowsay | lolcat
    cat ~/dotfiles/misc/ascii/banner_colored.txt | lolcat
end
