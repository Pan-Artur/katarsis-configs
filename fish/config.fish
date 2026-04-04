### Interactive Session Settings ###

if status is-interactive
    # Disable greeting
    set -g fish_greeting

    ### Environment Variables ###
	set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk
    set -x PATH $JAVA_HOME/bin $PATH

    ### Aliases ###
    
	# Navigation
    alias ..='cd ..'
    alias ...='cd ../..'
    alias .3='cd ../../../'

    # Pacman & Yay
    alias update='sudo pacman -Syu'
    alias install='sudo pacman -S'
    alias unlock='sudo rm /var/lib/pacman/db.lck'

    # Config Shortcuts (Fast edit)
    alias conf-hypr='nvim ~/.config/hypr/hyprland.conf'
    alias conf-waybar='nvim ~/.config/waybar/config'
    alias conf-kitty='nvim ~/.config/kitty/kitty.conf'

    # Utilities
    alias v='nvim'
    alias ff='fastfetch'
end
