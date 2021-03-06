# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/rpy/rpy-2.1.3.ebuild,v 1.5 2010/07/31 20:07:48 armin76 Exp $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils

SLOT=2
MYPN=${PN}${SLOT}
MYP=${MYPN}-${PV}

DESCRIPTION="Python interface to the R Programming Language"
HOMEPAGE="http://rpy.sourceforge.net/ http://pypi.python.org/pypi/rpy2"
SRC_URI="http://pypi.python.org/packages/source/r/${MYPN}/${MYP}.tar.gz"

LICENSE="GPL-2 LGPL-2.1 MPL-1.1"
SLOT="0"
KEYWORDS="amd64 ia64 x86 ~x86-linux"
IUSE=""

RDEPEND=">=dev-lang/R-2.8
	dev-python/numpy
	!<=dev-python/rpy-1.0.2-r2"
DEPEND="${RDEPEND}"

RESTRICT_PYTHON_ABIS="3.*"
PYTHON_MODNAME="${MYPN}"

S="${WORKDIR}/${MYP}"

src_test() {
	testing() {
		PYTHONPATH="$(ls -d build-${PYTHON_ABI}/lib.*)" \
			"$(PYTHON)" rpy/tests.py
	}
	python_execute_function testing
}
