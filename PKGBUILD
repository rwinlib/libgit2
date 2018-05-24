# Maintainer: Martell Malone <martellmalone@gmail.com>

_realname=libgit2
pkgbase=mingw-w64-${_realname}
pkgname="${MINGW_PACKAGE_PREFIX}-${_realname}"
pkgver=0.27.0
pkgrel=1
pkgdesc='A linkable library for Git (mingw-w64)'
arch=('any')
url='https://github.com/libgit2/libgit2'
license=('GPL2' 'custom')
options=('strip')
depends=("${MINGW_PACKAGE_PREFIX}-curl"
         "${MINGW_PACKAGE_PREFIX}-http-parser"
         "${MINGW_PACKAGE_PREFIX}-libssh2"
         "${MINGW_PACKAGE_PREFIX}-openssl"
         "${MINGW_PACKAGE_PREFIX}-zlib")
makedepends=("${MINGW_PACKAGE_PREFIX}-cmake" "${MINGW_PACKAGE_PREFIX}-gcc")
source=(${_realname}-${pkgver}.tar.gz::"https://github.com/libgit2/libgit2/archive/v${pkgver}.tar.gz")
noextract=(${_realname}-${pkgver}.tar.gz)
sha256sums=('545b0458292c786aba334f1bf1c8f73600ae73dd7205a7bb791a187ee48ab8d2')

prepare() {
  tar --exclude tests/resources/testrepo-worktree/link_to_new.txt -zxf ${_realname}-${pkgver}.tar.gz
  cd ${_realname}-${pkgver}
}

build() {
  [[ -d "${srcdir}"/build-${MINGW_CHOST} ]] && rm -rf "${srcdir}"/build-${MINGW_CHOST}
  mkdir -p "${srcdir}"/build-${MINGW_CHOST} && cd "${srcdir}"/build-${MINGW_CHOST}
  rm ../${_realname}-${pkgver}/src/win32/thread.c
  MSYS2_ARG_CONV_EXCL="-DCMAKE_INSTALL_PREFIX=" \
  ${MINGW_PREFIX}/bin/cmake.exe \
    -G"MSYS Makefiles" \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX=${MINGW_PREFIX} \
    -DCMAKE_C_FLAGS="-DCURL_STATICLIB" \
    -DCMAKE_EXE_LINKER_FLAGS="-L${MINGW_PREFIX}/lib" \
    -DPKG_CONFIG_WITHOUT_PREFIX=ON \
    -DWINHTTP=ON \
    -DTHREADSAFE=OFF \
    ../${_realname}-${pkgver}

  make VERBOSE=1
}

package() {
  cd ${srcdir}/build-${MINGW_CHOST}
  make DESTDIR=${pkgdir} install
}
