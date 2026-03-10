function __fun_error_hook --on-event fish_postexec
    set -l last_status $status
    if test $last_status -ne 0
        if test -x /usr/bin/fun-error
            nice -n 19 /usr/bin/fun-error $last_status >/dev/null 2>&1 & disown
        end
    end
end
