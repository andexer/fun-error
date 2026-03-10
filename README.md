# fun-error

Utilidad ultraligera de terminal escrita en Rust que provee retroalimentación auditiva humorística al fallar un comando, diseñada para el ecosistema Cortex.

## Instalación

Descarga los paquetes de la página de Releases o compila desde fuente:

### Arch Linux / Manjaro
Descarga el código fuente de la página de releases, extráelo y compílalo usando el `PKGBUILD` incluido:

```bash
# Descarga y extrae el archivo fuente del release
wget https://github.com/andexer/fun-error/archive/refs/tags/v1.0.0-rc1.tar.gz
tar -xzf v1.0.0-rc1.tar.gz
cd fun-error-1.0.0-rc1

# Compila y autoinstala el paquete pacman nativo
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
