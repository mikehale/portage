# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/py-xmlrpc/py-xmlrpc-0.8.8.3-r1.ebuild,v 1.4 2010/06/20 18:25:38 armin76 Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils eutils

DESCRIPTION="Fast XML-RPC implementation for Python"
HOMEPAGE="http://sourceforge.net/projects/py-xmlrpc/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="alpha ~amd64 ia64 ~ppc sparc x86"
IUSE="examples"

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="pyxmlrpclib.py xmlrpc.py"

src_prepare() {
	#http://www.FreeBSD.org/cgi/cvsweb.cgi/ports/net/py-xmlrpc/files/
	epatch "${FILESDIR}/${PN}_patch-extra.patch"
	epatch "${FILESDIR}/${PN}_rpcBase64.patch"
	epatch "${FILESDIR}/${PN}_rpcClient.patch"
	epatch "${FILESDIR}/${PN}_rpcDate.patch"
	epatch "${FILESDIR}/${PN}_rpcDispatch.patch"
	epatch "${FILESDIR}/${PN}_rpcUtils.patch"
	epatch "${FILESDIR}/${PN}_rpcSource.patch"

	distutils_src_prepare
}

src_install () {
	distutils_src_install

	if use examples; then
		insinto "/usr/share/doc/${PF}/examples"
		doins examples/*
		insinto "/usr/share/doc/${PF}/examples/crj"
		doins examples/crj/*
	fi
}
