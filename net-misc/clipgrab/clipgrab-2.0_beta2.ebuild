# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/clipgrab/clipgrab-2.0_beta2.ebuild,v 1.4 2009/02/13 21:52:57 yngwin Exp $

EAPI=1
inherit qt4 versionator

MY_PV=$(replace_version_separator 2 '-' )

DESCRIPTION="Download videos from Youtube, Google Video, MyVideo,
Dailymotion, ClipFish, Veoh.com and others."
HOMEPAGE="http://clipgrab.de"
SRC_URI="http://${PN}.de/download/${PN}-${MY_PV}_src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="sparc x86"
IUSE="debug"

DEPEND="x11-libs/qt-gui:4"
RDEPEND="x11-misc/xdg-utils
		media-video/ffmpeg
		${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	unpack ${A}
	cd "${S}"/src
	use debug || echo -e "\nDEFINES += QT_NO_DEBUG_OUTPUT" >> src.pro
}

src_compile() {
	cd "${S}"/src
	eqmake4 src.pro
	emake || die "emake failed"
}

src_install() {
	# upstream's Makefile has no install target :(
	cd "${S}"
	dobin bin/clipgrab || die "dobin failed"
	dodoc src/README || die "dodoc failed"
}

# vim:ts=4
