# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-arcade/vor/vor-0.5.4.ebuild,v 1.3 2010/01/06 13:03:38 josejx Exp $

EAPI=2
inherit eutils games

DESCRIPTION="Variations on Rockdodger: Dodge the rocks until you die"
HOMEPAGE="http://jasonwoof.org/vor"
SRC_URI="http://qualdan.com/vor/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

DEPEND="media-libs/libsdl
	media-libs/sdl-image[png]
	media-libs/sdl-mixer[mikmod]"

src_compile() {
	emake \
		CFLAGS="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}" \
		pkgdatadir="${GAMES_DATADIR}"/${PN} \
		|| die "emake failed"
}

src_install() {
	dogamesbin ${PN} || die "dogamesbin failed"
	insinto "${GAMES_DATADIR}"/${PN}
	doins data/* || die "doins failed"
	newicon data/icon.png ${PN}.png
	make_desktop_entry ${PN} VoR
	dodoc README todo
	prepgamesdirs
}
