# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lisp/cl-webactions/cl-webactions-1.2.42.20050220.ebuild,v 1.4 2007/02/03 17:50:19 flameeyes Exp $

inherit common-lisp eutils

MY_PV=${PV:0:6}
CVS_PV=${PV:7:4}.${PV:11:2}.${PV:13}

DESCRIPTION="Webactions is Franz's library for dispatching HTTP requests as well as processing HTML templates."
HOMEPAGE="http://portableaserve.sourceforge.net/
	http://packages.debian.org/unstable/web/cl-webactions.html"
SRC_URI="mirror://debian/pool/main/c/cl-portable-aserve/cl-portable-aserve_${MY_PV}+cvs.${CVS_PV}.tar.gz"
LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~sparc x86"
IUSE=""
DEPEND="=dev-lisp/cl-aserve-${PV}*"

CLPACKAGE=webactions

S=${WORKDIR}/cl-portable-aserve-${MY_PV}+cvs.${CVS_PV}

src_install() {
	common-lisp-install aserve/webactions/*.cl aserve/webactions/*.asd
	common-lisp-system-symlink
	insinto $CLSOURCEROOT/webactions/clpcode; doins aserve/webactions/clpcode/*.cl
	dohtml aserve/webactions/doc/*
	dodoc aserve/webactions/ChangeLog
	docinto examples
	dodoc contrib/*.lisp
	do-debian-credits
}
