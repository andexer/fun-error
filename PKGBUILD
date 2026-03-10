# Maintainer: Tu Nombre <tu@email.com>
pkgname=fun-error
pkgver=0.1.3
pkgrel=1
pkgdesc="Utilidad de terminal ultraligera con retroalimentación auditiva para Cortex"
arch=('x86_64')
url="https://github.com/andexer/fun-error"
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP') # Nota: Recuerda reemplazar SKIP con el hash real (makepkg -g)

build() {
  cd "$pkgname-$pkgver"
  
  # Compilación estática y optimizada de Rust
  cargo build --release --locked
}

# Si hay tests, es una buena práctica ejecutarlos en el empaquetado
check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  
  # Instalar el binario ejecutable
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Instalar hooks interactivos globales para Bash, Zsh y Fish
  install -Dm644 "conf/fun-error.fish" "$pkgdir/etc/fish/conf.d/fun-error.fish"
  install -Dm644 "conf/fun-error.bash" "$pkgdir/etc/profile.d/fun-error.sh"
  install -Dm644 "conf/fun-error.zsh" "$pkgdir/etc/profile.d/fun-error.zsh"
}
