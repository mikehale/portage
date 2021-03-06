# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/mbrowse/mbrowse-0.3.1.ebuild,v 1.10 2005/10/09 12:12:11 mkay Exp $

inherit eutils

DESCRIPTION="MBrowse is a graphical MIB browser"
HOMEPAGE="http://www.kill-9.org/mbrowse/index.html"
SRC_URI="http://www.kill-9.org/mbrowse/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc sparc x86"
IUSE=""

DEPEND="net-analyzer/net-snmp
	=x11-libs/gtk+-1.2*"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/0.3.1-gentoo.patch
}

src_compile() {
	./configure \
		--host=${CHOST} \
		--prefix=/usr \
		--infodir=/usr/share/info \
		--mandir=/usr/share/man || die "./configure failed"

	emake || die
}

src_install() {
	make DESTDIR=${D} install || die

	dodoc AUTHORS README ChangeLog
}
