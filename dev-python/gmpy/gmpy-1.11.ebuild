# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/gmpy/gmpy-1.11.ebuild,v 1.5 2010/07/17 22:46:31 arfrever Exp $

EAPI="3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils

DESCRIPTION="Python bindings for dev-libs/gmp"
HOMEPAGE="http://www.aleax.it/gmpy.html http://code.google.com/p/gmpy/ http://pypi.python.org/pypi/gmpy"
SRC_URI="http://${PN}.googlecode.com/files/${P}.zip"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ~ia64 x86"
IUSE=""

RDEPEND="dev-libs/gmp"
DEPEND="${RDEPEND}
	app-arch/unzip"

PYTHON_CFLAGS=("2.* + -fno-strict-aliasing")

DISTUTILS_SETUP_FILES=("setup.py" "setes.py")

src_prepare() {
	distutils_src_prepare
	epatch "${FILESDIR}/${P}-tests.patch"
}

src_test() {
	testing() {
		if [[ "${PYTHON_ABI}" == 3.* ]]; then
			pushd test3 > /dev/null
		else
			pushd test > /dev/null
		fi
		PYTHONPATH="$(ls -d ../build-${PYTHON_ABI}/lib.*)" "$(PYTHON)" gmpy_test.py || return 1
		popd > /dev/null
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install
	dohtml doc/index.html
	dodoc doc/gmpydoc.txt
}
