# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xplanet/xplanet-1.2.1.ebuild,v 1.5 2010/07/04 10:00:29 ssuominen Exp $

EAPI=2
inherit eutils

DESCRIPTION="a program to render images of the earth into the X root window"
HOMEPAGE="http://xplanet.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ppc ppc64 ~sparc x86"
IUSE="gif jpeg X truetype tiff png"

RDEPEND="X? ( x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXt
	x11-libs/libXext )
	gif? ( media-libs/giflib )
	jpeg? ( media-libs/jpeg )
	tiff? ( media-libs/tiff )
	png? ( media-libs/libpng
		media-libs/netpbm )
	truetype? ( =media-libs/freetype-2*
		x11-libs/pango )"
DEPEND="${RDEPEND}
	X? ( x11-proto/xproto
	x11-proto/scrnsaverproto )"

src_prepare() {
	epatch "${FILESDIR}"/${P}-gentoo.patch
}

src_configure() {
	local myconf

	use X \
		&& myconf="${myconf} --with-x --with-xscreensaver" \
		|| myconf="${myconf} --with-x=no --with-xscreensaver=no"

	use gif \
		&& myconf="${myconf} --with-gif" \
		|| myconf="${myconf} --with-gif=no"

	use jpeg \
		&& myconf="${myconf} --with-jpeg" \
		|| myconf="${myconf} --with-jpeg=no"

	use tiff \
		&& myconf="${myconf} --with-tiff" \
		|| myconf="${myconf} --with-tiff=no"

	use png \
		&& myconf="${myconf} --with-png --with-pnm" \
		|| myconf="${myconf} --with-png=no --with-pnm=no"

	use truetype \
		&& myconf="${myconf} --with-freetype --with-pango" \
		|| myconf="${myconf} --with-freetype=no --with-pango=no"

	econf \
		--with-cspice=no \
		${myconf}
}

src_install () {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README TODO
}
