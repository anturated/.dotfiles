source ~/.config/fish/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    echo ""
    fastfetch
    echo ""
    echo ""
end

### asdf begin

if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims


### asdf end


alias dalarm="cd ~/Documents/projects/alarm && source bin/activate.fish && python main.py"
alias yay="paru"
alias vpnon="systemctl start openvpn-ukraineVPN.service"
alias vpnoff="systemctl stop openvpn-ukraineVPN.service"
alias refreshwifi="nmcli device wifi rescan"
alias ff="fastfetch"

starship init fish | source
zoxide init fish | source
# thefuck --alias | source
