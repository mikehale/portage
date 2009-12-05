# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-zope/zope-browserpage/zope-browserpage-3.9.0.ebuild,v 1.1 2009/12/05 02:17:37 arfrever Exp $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

MY_PN="${PN/-/.}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="ZCML directives for configuration browser views for Zope 3."
HOMEPAGE="http://pypi.python.org/pypi/zope.browserpage"
SRC_URI="http://pypi.python.org/packages/source/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="net-zope/zope-app-pagetemplate
	net-zope/zope-browsermenu
	net-zope/zope-component
	net-zope/zope-configuration
	net-zope/zope-interface
	net-zope/zope-publisher
	net-zope/zope-schema
	net-zope/zope-security"
DEPEND="${RDEPEND}
	dev-python/setuptools"
RESTRICT_PYTHON_ABIS="3.*"

S="${WORKDIR}/${MY_P}"

PYTHON_MODNAME="${PN/-//}"
DOCS="CHANGES.txt README.txt"
