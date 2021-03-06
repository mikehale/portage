# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/tgmochikit/tgmochikit-1.4.2.ebuild,v 1.1 2010/07/09 15:37:08 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit distutils

MY_PN="tgMochiKit"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="MochiKit packaged as TurboGears widgets."
HOMEPAGE="http://pypi.python.org/pypi/tgMochiKit"
SRC_URI="http://pypi.python.org/packages/source/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="|| ( AFL-2.1 MIT )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

DOCS="ChangeLog README.txt"
