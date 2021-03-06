# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-misc/fortune-mod-woody-allen-it/fortune-mod-woody-allen-it-0.1.ebuild,v 1.3 2008/08/01 19:56:55 ken69267 Exp $

DESCRIPTION="Fortune database for Woody Allen quotes (in Italian)"
HOMEPAGE="http://somemixedstuff.blogspot.com/2007/04/set-of-fortunes-of-woody-allen-quotes.html"
SRC_URI="http://utenti.lycos.it/gutter/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="games-misc/fortune-mod"

S="${WORKDIR}"/${PN}

src_install() {
	insinto /usr/share/fortune
	doins ${PN} ${PN}.dat || die "doins failed"
}
