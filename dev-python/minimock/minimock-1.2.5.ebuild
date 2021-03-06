# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/minimock/minimock-1.2.5.ebuild,v 1.4 2010/07/06 19:48:04 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_PN="MiniMock"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="The simplest possible mock library"
HOMEPAGE="http://pypi.python.org/pypi/MiniMock"
SRC_URI="http://pypi.python.org/packages/source/M/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

S="${WORKDIR}/${MY_P}"

DOCS="docs/changelog.txt docs/index.txt"
PYTHON_MODNAME="minimock.py"
