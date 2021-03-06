# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/vorbis-tools/vorbis-tools-1.4.0.ebuild,v 1.11 2010/08/24 14:37:57 darkside Exp $

EAPI=2

DESCRIPTION="tools for using the Ogg Vorbis sound file format"
HOMEPAGE="http://www.vorbis.com"
SRC_URI="http://downloads.xiph.org/releases/vorbis/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ~ia64 ~mips ppc ppc64 ~sparc x86 ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
IUSE="flac kate nls +ogg123 speex"

RDEPEND=">=media-libs/libvorbis-1.3.0
	flac? ( media-libs/flac )
	kate? ( media-libs/libkate )
	ogg123? ( >=media-libs/libao-1.0.0
		net-misc/curl )
	speex? ( media-libs/speex )"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )
	dev-util/pkgconfig"

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_enable nls) \
		$(use_enable ogg123) \
		$(use_with flac) \
		$(use_with speex) \
		$(use_with kate)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS CHANGES README
}
