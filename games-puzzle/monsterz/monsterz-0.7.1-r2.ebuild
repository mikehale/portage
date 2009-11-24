# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-puzzle/monsterz/monsterz-0.7.1-r2.ebuild,v 1.4 2009/11/23 13:46:36 volkmar Exp $

EAPI=2
inherit eutils games

DESCRIPTION="a little puzzle game, similar to the famous Bejeweled or Zookeeper"
HOMEPAGE="http://sam.zoy.org/projects/monsterz/"
SRC_URI="http://sam.zoy.org/projects/monsterz/${P}.tar.gz"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="amd64 ~hppa ppc sparc x86"
IUSE=""

DEPEND="dev-python/pygame
	media-libs/sdl-image[png]
	media-libs/sdl-mixer[mikmod]"

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-gentoo.patch \
		"${FILESDIR}"/${P}-64bit.patch \
		"${FILESDIR}"/${P}-blit.patch
	sed -i \
		-e "s:GENTOO_DATADIR:${GAMES_DATADIR}/${PN}:" \
		monsterz.py || die "sed failed"
	rm -f Makefile
}

src_install() {
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r graphics sound || die "doins failed"
	newgamesbin monsterz.py ${PN} || die "newgamesbin failed"
	newicon graphics/icon.png ${PN}.png
	make_desktop_entry ${PN} Monsterz
	dodoc README AUTHORS TODO
	prepgamesdirs
}
