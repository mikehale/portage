# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyflakes/pyflakes-0.4.0.ebuild,v 1.5 2010/07/08 15:29:36 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit distutils

DESCRIPTION="Passive checker for python programs."
HOMEPAGE="http://divmod.org/trac/wiki/DivmodPyflakes http://pypi.python.org/pypi/pyflakes"
SRC_URI="http://pypi.python.org/packages/source/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~ia64 x86 ~amd64-linux ~x86-linux ~x86-macos"
IUSE=""

DEPEND="test? ( dev-python/twisted )"
RDEPEND=""
