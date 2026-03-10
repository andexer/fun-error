# Retroalimentación auditiva de fun-error para Bash y Zsh
# Este archivo es cargado por /etc/profile.d/ en ambos shells

__fun_error_hook() {
    local last_status=$?
    if [ $last_status -ne 0 ]; then
        if [ -x /usr/bin/fun-error ]; then
            nice -n 19 /usr/bin/fun-error $last_status >/dev/null 2>&1 & disown
        fi
    fi
}

# Bash: inyectar en PROMPT_COMMAND
if [ -n "$BASH_VERSION" ]; then
    if [[ ! "$PROMPT_COMMAND" == *"__fun_error_hook"* ]]; then
        PROMPT_COMMAND="__fun_error_hook; $PROMPT_COMMAND"
    fi
fi

# Zsh: inyectar en precmd usando add-zsh-hook
if [ -n "$ZSH_VERSION" ]; then
    autoload -Uz add-zsh-hook
    add-zsh-hook precmd __fun_error_hook
fi
