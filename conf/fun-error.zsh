# Añade la retroalimentación de fun-error en Zsh
__fun_error_hook() {
    local last_status=$?
    if [ $last_status -ne 0 ]; then
        if [ -x /usr/bin/fun-error ]; then
            nice -n 19 /usr/bin/fun-error $last_status >/dev/null 2>&1 & disown
        fi
    fi
}

if [ -n "$ZSH_VERSION" ]; then
    autoload -Uz add-zsh-hook
    add-zsh-hook precmd __fun_error_hook
fi
