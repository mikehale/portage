# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/xstow/xstow-0.5.1.ebuild,v 1.4 2008/04/28 21:22:20 drac Exp $

inherit eutils

DESCRIPTION="replacement for GNU stow with extensions"
HOMEPAGE="http://xstow.sourceforge.net/"
SRC_URI="mirror://sourceforge/xstow/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86"
IUSE="ncurses"

DEPEND="ncurses? ( sys-libs/ncurses )"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-gcc43.patch
}

src_compile() {
	econf --disable-dependency-tracking $(use_with ncurses curses)
	emake || die "emake failed."
}

src_install() {
	emake DESTDIR="${D}" docdir="/usr/share/doc/${PF}/html" \
		install || die "emake install failed."
	dodoc AUTHORS ChangeLog NEWS README TODO
}
