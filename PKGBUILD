# Maintainer: Tu Nombre <tu@email.com>
pkgname=fun-error
pkgver=0.1.0
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
  
  # Instalar la licencia
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Aquí podríamos inyectar scripts de post-instalación (.install) o hooks para fish/zsh/bash,
  # por ejemplo, si tienes un archivo de conf de fish:
  # install -Dm644 "scripts/fun-error.fish" "$pkgdir/usr/share/fish/vendor_conf.d/fun-error.fish"
}
