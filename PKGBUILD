# Maintainer: Tu Nombre <tu@email.com>
pkgname=fun-error
pkgver=1.0.0_rc1
pkgrel=1
pkgdesc="Utilidad de terminal ultraligera con retroalimentación auditiva para Cortex"
arch=('x86_64')
url="https://github.com/andexer/fun-error"
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v1.0.0-rc1.tar.gz")
sha256sums=('SKIP') # Nota: Recuerda reemplazar SKIP con el hash real (makepkg -g)

build() {
  cd "$pkgname-1.0.0-rc1"
  
  # Compilación estática y optimizada de Rust
  cargo build --release --locked
}

# Si hay tests, es una buena práctica ejecutarlos en el empaquetado
check() {
  cd "$pkgname-1.0.0-rc1"
  cargo test --release --locked
}

package() {
  cd "$pkgname-1.0.0-rc1"
  
  # Instalar el binario ejecutable
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Instalar hooks interactivos globales para Bash y Fish (Zsh integrado en Bash)
  install -Dm644 "conf/fun-error.fish" "$pkgdir/etc/fish/conf.d/fun-error.fish"
  install -Dm644 "conf/fun-error.bash" "$pkgdir/etc/profile.d/fun-error.sh"
}
