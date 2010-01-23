# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-zope/zope-testbrowser/zope-testbrowser-3.7.0.ebuild,v 1.3 2010/01/22 19:25:42 ranger Exp $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

MY_PN="${PN/-/.}"
MY_P="${MY_PN}-${PV/_alpha/a}"

DESCRIPTION="Programmable browser for functional black-box tests"
HOMEPAGE="http://pypi.python.org/pypi/zope.testbrowser"
SRC_URI="http://pypi.python.org/packages/source/${MY_PN:0:1}/${MY_PN}/${MY_P}.zip"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND="dev-python/clientform
	dev-python/mechanize
	dev-python/pytz
	net-zope/zope-app-testing
	net-zope/zope-interface
	net-zope/zope-schema"
DEPEND="${RDEPEND}
	app-arch/unzip
	dev-python/setuptools"
RESTRICT_PYTHON_ABIS="3.*"

S="${WORKDIR}/${MY_P}"

PYTHON_MODNAME="${PN/-//}"
DOCS="CHANGES.txt README.txt"
