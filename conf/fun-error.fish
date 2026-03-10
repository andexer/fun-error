function __fun_error_hook --on-event fish_postexec
    set -l last_status $status
    if test $last_status -ne 0
        if test -x /usr/bin/fun-error
            # Usar bash para independizar completamente el proceso en segundo plano
            # y evitar que el control de trabajos (job control) de Fish mate el audio
            bash -c "nice -n 19 /usr/bin/fun-error $last_status </dev/null >/dev/null 2>&1 &"
        end
    end
end
