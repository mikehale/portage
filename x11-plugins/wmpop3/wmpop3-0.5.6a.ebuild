# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/wmpop3/wmpop3-0.5.6a.ebuild,v 1.13 2010/07/22 14:36:44 ssuominen Exp $

DESCRIPTION="dockapp for checking pop3 accounts"
HOMEPAGE="http://www.cs.mun.ca/~scotth/"
SRC_URI="http://www.cs.mun.ca/~scotth/download/${P/wmpop3/WMPop3}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~sparc x86"
IUSE=""
DEPEND="x11-wm/windowmaker
	>=sys-apps/sed-4
	x11-libs/libXpm"

src_unpack() {
	unpack ${A}
	cd "${S}"/wmpop3
	sed -i -e "s:-O2:${CFLAGS}:" Makefile
}

src_compile() {
	emake -C wmpop3 || die
}

src_install() {
	dobin wmpop3/wmpop3
	dodoc CHANGE_LOG README
}
