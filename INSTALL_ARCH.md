# Guía de Instalación en Arch Linux / Manjaro

Para instalar `fun-error` como un **Release Candidate** en Arch Linux, sigue estos pasos:

### 1. Requisitos previos
Asegúrate de tener instaladas las herramientas de compilación de Rust y git:
```bash
sudo pacman -S --needed base-devel rust cargo git
```

### 2. Instalación desde el código fuente (Método recomendado para RC)
Dado que es una "Release Candidate", lo mejor es clonar el repositorio y usar el `PKGBUILD` que hemos preparado:

```bash
git clone https://github.com/andexer/fun-error.git
cd fun-error
# Esto compilará el proyecto y generará el paquete .pkg.tar.zst
makepkg -si
```

### 3. Verificación
Una vez instalado, el binario estará en `/usr/bin/fun-error`. 
Los hooks para la terminal ya están configurados para activarse automáticamente en:
- **Bash:** `/etc/profile.d/fun-error.sh`
- **Zsh:** `/etc/profile.d/fun-error.sh` (Zsh carga archivos .sh de profile.d)
- **Fish:** `/etc/fish/conf.d/fun-error.fish`

### 4. Activar sin reiniciar
Para que los cambios surtan efecto en tu terminal actual sin cerrarla:
- **Bash/Zsh:** `source /etc/profile.d/fun-error.sh`
- **Fish:** `source /etc/fish/conf.d/fun-error.fish`

### 5. Cómo desinstalar
Si deseas eliminar la aplicación:
```bash
sudo pacman -Rs fun-error
```

---
**Nota:** Si ya has publicado la release en GitHub, también podrías descargar el `.tar.gz` de la sección de Releases y ejecutar `makepkg -si` dentro de la carpeta descomprimida.
