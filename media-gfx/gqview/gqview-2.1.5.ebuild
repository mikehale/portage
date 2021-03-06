# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/gqview/gqview-2.1.5.ebuild,v 1.12 2010/06/21 10:14:37 ssuominen Exp $

EAPI=2
inherit eutils

DESCRIPTION="A GTK-based image browser"
HOMEPAGE="http://gqview.sourceforge.net/"
SRC_URI="mirror://sourceforge/gqview/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86"
IUSE="lcms"

RDEPEND=">=x11-libs/gtk+-2.4
	lcms? ( =media-libs/lcms-1* )
	virtual/libintl"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-devel/gettext"

src_prepare() {
	epatch "${FILESDIR}/${P}-windows.patch"
	sed -i \
		-e '/^Encoding/d' \
		-e '/^Icon/s/\.png//' \
		-e '/^Categories/s/Application;//' \
		gqview.desktop \
		|| die
}

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_with lcms)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	# leave README uncompressed because the program reads it
	dodoc AUTHORS ChangeLog TODO
	rm -f "${D}/usr/share/doc/${PF}/COPYING"
}
