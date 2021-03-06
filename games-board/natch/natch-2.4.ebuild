# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-board/natch/natch-2.4.ebuild,v 1.1 2006/04/23 06:36:08 mr_bones_ Exp $

inherit games

MY_P="Natch-${PV}"
DESCRIPTION="A program to solve chess proof games"
HOMEPAGE="http://natch.free.fr/Natch.html"
SRC_URI="http://natch.free.fr/Natch/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~ppc x86"
IUSE=""

DEPEND="sys-libs/ncurses"

S=${WORKDIR}/${MY_P}

src_install() {
	newgamesbin src/Natch natch || die "dogamesbin failed"
	dodoc AUTHORS ChangeLog NEWS README THANKS example.txt
	prepgamesdirs
}
