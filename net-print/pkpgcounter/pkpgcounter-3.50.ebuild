# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-print/pkpgcounter/pkpgcounter-3.50.ebuild,v 1.1 2008/10/06 19:06:16 sbriesen Exp $

inherit distutils

DESCRIPTION="pkpgcounter is a python generic PDL (Page Description Language) parser"
HOMEPAGE="http://www.pykota.com/software/pkpgcounter"
SRC_URI="http://www.pykota.com/software/${PN}/download/tarballs/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="psyco"  # psyco is available only for x86

DEPEND="virtual/python
	dev-python/imaging
	x86? ( psyco? ( dev-python/psyco ) )"

RDEPEND="${DEPEND}"

DOCS="BUGS CREDITS NEWS README PKG-INFO"
PYTHON_MODNAME="pkpgpdls"

src_install() {
	distutils_src_install

	rm -rf "${D}usr/share/doc/${PN}"
}
