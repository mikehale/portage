# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-roguelike/crossfire-client/crossfire-client-1.12.0.ebuild,v 1.4 2010/02/11 14:17:15 fauli Exp $

EAPI=2
inherit eutils games

DESCRIPTION="Client for the nethack-style but more in the line of UO"
HOMEPAGE="http://crossfire.real-time.com/"
SRC_URI="mirror://sourceforge/crossfire/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ppc x86"
IUSE="alsa gtk oss sdl"

RDEPEND="alsa? ( media-libs/alsa-lib )
	gtk? ( x11-libs/gtk+:2
		sdl? ( media-libs/libsdl[video]
			media-libs/sdl-image ) )
	virtual/glut
	media-libs/libpng
	sys-libs/zlib"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	sed -i \
		-r '/^.TH/s:$: 6:' \
		$(find . -name "*man") \
		|| die "sed failed"
	epatch "${FILESDIR}/${P}-lua.patch"
}

src_configure() {
	# bugs in configure script so we cant use $(use_enable ...)
	local myconf="--disable-dependency-tracking"

	if use gtk ; then
		use sdl || myconf="${myconf} --disable-sdl"
	else
		myconf="${myconf} --disable-gtk"
	fi
	if ! use alsa ; then
		myconf="${myconf} --disable-alsa9 --disable-alsa"
	fi
	if ! use alsa && ! use oss ; then
		myconf="${myconf} --disable-sound"
	fi
	egamesconf ${myconf}
}

src_compile() {
	# bug 139785
	if use alsa || use oss ; then
		emake -j1 -C sound-src || die "sound building failed"
	fi
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog README TODO
	prepgamesdirs
}
