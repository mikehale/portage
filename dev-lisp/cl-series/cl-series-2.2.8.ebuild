# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lisp/cl-series/cl-series-2.2.8.ebuild,v 1.4 2005/05/24 18:48:35 mkennedy Exp $

inherit common-lisp eutils

DESCRIPTION="Common Lisp extension for general iteration"
HOMEPAGE="http://series.sf.net"
SRC_URI="mirror://sourceforge/series/series-${PV}.tar.bz2"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc x86"
IUSE=""
DEPEND="dev-lisp/common-lisp-controller
	virtual/commonlisp"

CLPACKAGE=series

S=${WORKDIR}/${PN#cl-}-${PV}

src_unpack() {
	unpack ${A}
#	epatch ${FILESDIR}/${PV}-sbcl-gentoo.patch || die
}

src_compile() {
	:
}

src_install() {
	common-lisp-install *.lisp series.asd
	common-lisp-system-symlink
	dodoc RELEASE-NOTES ChangeLog s-doc.txt
}
