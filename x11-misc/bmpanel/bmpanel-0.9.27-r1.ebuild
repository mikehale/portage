# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/bmpanel/bmpanel-0.9.27-r1.ebuild,v 1.1 2010/08/29 08:20:17 hwoarang Exp $

EAPI=2

inherit base eutils

DESCRIPTION="a lightweight, NETWM compliant panel for X11 Window System."
HOMEPAGE="http://nsf.110mb.com/bmpanel"
SRC_URI="http://nsf.110mb.com/${PN}/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~ppc"
IUSE="debug libev libevent"

RDEPEND=">=media-libs/imlib2-1.4.0
	media-libs/freetype:2
	x11-libs/libX11
	x11-libs/libXrender
	x11-libs/libXcomposite
	x11-libs/libXfixes
	media-libs/fontconfig
	libev? ( dev-libs/libev )
	libevent? ( dev-libs/libevent )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

PATCHES=(
	"${FILESDIR}/Makefile.patch"
)

DOCS=( AUTHORS README )

src_configure() {
	# the provided configure script is broken.
	# it doesn't provide --disable-foo, --host etc. so we can't use econf here.
	local myconf="--prefix=/usr --ugly"

	use debug && myconf="${myconf} --debug"
	use libev && myconf="${myconf} --with-ev"
	use libevent && myconf="${myconf} --with-event"

	einfo "./configure ${myconf}"
	./configure ${myconf} || die "configure failed"
}
