# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/simpleparse/simpleparse-2.1.1_alpha2.ebuild,v 1.1 2010/07/14 18:33:46 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_P="SimpleParse-${PV/_alpha/a}"

DESCRIPTION="A Parser Generator for mxTextTools."
HOMEPAGE="http://simpleparse.sourceforge.net http://pypi.python.org/pypi/SimpleParse"
SRC_URI="mirror://sourceforge/simpleparse/${MY_P}.tar.gz"

LICENSE="as-is eGenixPublic-1.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~sparc ~x86"
IUSE="doc examples"

DEPEND="dev-python/setuptools"
RDEPEND=""

S="${WORKDIR}/${MY_P}"

PYTHON_CFLAGS=("2.* + -fno-strict-aliasing")

src_prepare() {
	distutils_src_prepare
	rm -f {examples,tests}/__init__.py
}

src_test() {
	testing() {
		PYTHONPATH="$(ls -d build-${PYTHON_ABI}/lib.*):." "$(PYTHON)" tests/test.py
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	if use doc ; then
		dohtml -r doc/*
	fi

	if use examples ; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}
