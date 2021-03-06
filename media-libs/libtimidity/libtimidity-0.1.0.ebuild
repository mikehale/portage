# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libtimidity/libtimidity-0.1.0.ebuild,v 1.11 2007/12/05 15:45:55 fmccor Exp $

inherit autotools eutils

DESCRIPTION="MIDI to WAVE converter library"
HOMEPAGE="http://libtimidity.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 sparc x86"
IUSE="ao debug"

RESTRICT="test"

RDEPEND="ao? ( media-libs/libao )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-automagic.patch
	eautoreconf
}

src_compile() {
	econf --disable-aotest $(use_enable ao) $(use_enable debug)
	emake || die "emake failed."
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc AUTHORS ChangeLog CHANGES NEWS TODO README*
}
