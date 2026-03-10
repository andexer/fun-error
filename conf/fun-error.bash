# Añade la retroalimentación de fun-error en Bash
__fun_error_hook() {
    local last_status=$?
    if [ $last_status -ne 0 ]; then
        if [ -x /usr/bin/fun-error ]; then
            nice -n 19 /usr/bin/fun-error $last_status >/dev/null 2>&1 & disown
        fi
    fi
}

# Verificamos si estamos en Bash para inyectar el hook seguro al comando de recarga
if [ -n "$BASH_VERSION" ]; then
    # Para encadenar con un prompt existente de forma segura
    if [[ ! "$PROMPT_COMMAND" == *"__fun_error_hook"* ]]; then
        PROMPT_COMMAND="__fun_error_hook; $PROMPT_COMMAND"
    fi
fi
