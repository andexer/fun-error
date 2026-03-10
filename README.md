# fun-error

Utilidad ultraligera de terminal escrita en Rust que provee retroalimentación auditiva humorística al fallar un comando, diseñada para el ecosistema Cortex.

## Instalación

Descarga los paquetes de la página de Releases o compila desde fuente:

### Arch Linux (AUR / PKGBUILD)
```bash
makepkg -si
```

### Fedora
```bash
sudo dnf install fun-error-*.rpm
```

### Debian/Ubuntu
```bash
sudo apt install ./fun-error_*.deb
```

## Configuración en Fish

Añade esto a `~/.config/fish/config.fish`:

```fish
function __fun_error_hook --on-event fish_postexec
    set -l last_status $status
    if test $last_status -ne 0
        nice -n 19 /usr/bin/fun-error $last_status >/dev/null 2>&1 & disown
    end
end
```
