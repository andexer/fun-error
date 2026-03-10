# Integración con Fish Shell — compatible con Fish 3.x y 4.x
# Se ejecuta al inicio de cada prompt (antes de mostrar el prompt),
# capturando el $status del último comando ejecutado.

function __fun_error_on_prompt --on-event fish_prompt
    # $status contiene el código de salida del último comando
    # Se captura AQUÍ, antes de que cualquier comando interno lo sobreescriba
    set -l last_status $status
    if test $last_status -ne 0
        if test -x /usr/bin/fun-error
            command bash -c "nice -n 19 /usr/bin/fun-error $last_status </dev/null >/dev/null 2>&1 &"
        end
    end
    # Retornar el status original para no alterar el prompt del usuario
    return $last_status
end
