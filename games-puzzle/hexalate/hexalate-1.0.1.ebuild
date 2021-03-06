# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-puzzle/hexalate/hexalate-1.0.1.ebuild,v 1.2 2010/02/27 15:35:11 phajdan.jr Exp $

EAPI=2
inherit eutils qt4 games

DESCRIPTION="A color matching game"
HOMEPAGE="http://gottcode.org/hexalate/"
SRC_URI="http://gottcode.org/${PN}/${P}-src.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

DEPEND="x11-libs/qt-gui:4"

src_configure() {
	eqmake4
}

src_install() {
	dogamesbin ${PN} || die
	doicon icons/${PN}.png
	domenu icons/${PN}.desktop
	dodoc README
	prepgamesdirs
}
