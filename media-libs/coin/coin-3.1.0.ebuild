# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/coin/coin-3.1.0.ebuild,v 1.5 2010/06/25 20:26:39 reavertm Exp $

EAPI=2

inherit eutils

MY_P=${P/c/C}
S="${WORKDIR}/${MY_P}"

DESCRIPTION="a high-level 3D graphics toolkit, fully compatible with SGI Open Inventor 2.1."
HOMEPAGE="http://www.coin3d.org/"
SRC_URI="ftp://ftp.coin3d.org/pub/coin/src/all/${MY_P}.tar.gz"

LICENSE="|| ( GPL-2 PEL )"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86"
IUSE="debug doc javascript openal"

RDEPEND="
	!x11-libs/qwt[doc]
	media-libs/fontconfig
	media-libs/freetype
	virtual/opengl
	virtual/glu
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXt
	x11-libs/libXext
	javascript? ( dev-lang/spidermonkey )
	openal? ( media-libs/openal )"

DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	dev-util/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}/${P}-javascript.patch"
}

src_configure() {
	econf \
		htmldir=/usr/share/doc/${PF}/html				\
		--disable-java-wrapper							\
		--enable-3ds-import								\
		--enable-threadsafe								\
		--with-fontconfig								\
		--with-freetype									\
		$(use_enable debug)								\
		$(use_enable debug symbols)						\
		$(use_enable doc html)							\
		$(use_enable doc man)							\
		$(use_enable javascript javascript-api)			\
		$(use_enable openal sound)						\
		$(use_with javascript spidermonkey)				\
		$(use_with openal)
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS FAQ FAQ.legal NEWS README RELNOTES THANKS	docs/ChangeLog.v${PV}
}
