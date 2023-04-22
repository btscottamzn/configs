if status is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
    base16-atelier-lakeside
    fish_vi_key_bindings
    fish_vi_cursor
end

fish_add_path $HOME/.toolbox/bin
fish_add_path /usr/local/go/bin $HOME/.local/bin $HOME/go/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin
fish_add_path $HOME/.cargo/bin
